# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-aws
pkgname=python-${_name}
pkgver=0.1.1
pkgrel=1
pkgdesc='LiveKit Agents Plugin for services from AWS.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-aws'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('6635a4cec63bf149314b59734b11e9e5471a89bff4ef69f5868fb410920f9e45')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy' 'python-aiobotocore' 'python-boto3' 'python-amazon-transcribe')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
