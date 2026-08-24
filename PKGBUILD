# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws_sdk_transcribe_streaming
pkgname=python-$_name
pkgver=0.11.0
pkgrel=1
pkgdesc='aws_sdk_transcribe_streaming client.'
arch=('any')
url="https://pypi.org/project/aws_sdk_transcribe_streaming"
license=('Apache-2.0')
depends=('python' 'python-smithy-aws-core' 'python-smithy-aws-event-stream' 'python-smithy-json' 'python-smithy-core' 'python-smithy-http' 'python-awscrt')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ec9fa7d635aed09df6be51a55ad9e39018b0a1451428916fcdf2b412714b00b3')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
