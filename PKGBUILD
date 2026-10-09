# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws_sdk_transcribe_streaming
pkgname=python-$_name
pkgver=0.12.0
pkgrel=1
pkgdesc='aws_sdk_transcribe_streaming client.'
arch=('any')
url="https://pypi.org/project/aws_sdk_transcribe_streaming"
license=('Apache-2.0')
depends=('python'
         'python-smithy-aws-core'
         'python-smithy-aws-event-stream'
         'python-smithy-json'
         'python-smithy-core'
         'python-smithy-http'
         'python-aiohttp'
         'python-yarl'
         'python-awscrt')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('78196b6a7b023e3353c2890f39a6404f3658e4071b91a84eb35992494f1d5fac')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
