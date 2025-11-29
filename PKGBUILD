# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langchain-openai
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="An integration package connecting OpenAI and LangChain."
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/partners/openai'
license=("MIT")
depends=('python' 'python-langchain-core' 'python-openai' 'python-tiktoken')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9a33280c2e8315d013d64e6b15e583be347beb0d0f281755c335ae504ad0c184')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
