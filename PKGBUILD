# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws_sdk_transcribe_streaming
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='aws_sdk_transcribe_streaming client.'
arch=('any')
url="https://pypi.org/project/aws_sdk_transcribe_streaming"
license=('Apache-2.0')
depends=('python' 'python-smithy-aws-core' 'python-smithy-aws-event-stream' 'python-smithy-json' 'python-smithy-core' 'python-smithy-http' 'python-awscrt')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('63f55209af4c48339c1dec076dff77f7d5780cf50eb7a0851b1411cffeaad7f2')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
