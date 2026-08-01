# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws_sdk_transcribe_streaming
pkgname=python-$_name
pkgver=0.8.0
pkgrel=1
pkgdesc='aws_sdk_transcribe_streaming client.'
arch=('any')
url="https://pypi.org/project/aws_sdk_transcribe_streaming"
license=('Apache-2.0')
depends=('python' 'python-smithy-aws-core' 'python-smithy-aws-event-stream' 'python-smithy-json' 'python-smithy-core' 'python-smithy-http' 'python-awscrt')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b946b2f8f2ab9a84914cdb69732cf94b87e222756d6d5506ac8bef173503fa45')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
