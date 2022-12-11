pkgname=chatgpt-git
pkgver=r421.a57bad7
pkgrel=1
pkgdesc=" Lightweight package for interacting with ChatGPT's API by OpenAI. Uses reverse engineered official API. "
arch=('x86_64')
url="https://github.com/acheong08/ChatGPT"
license=('GPL2')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/acheong08/ChatGPT")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "$srcdir/$pkgname"
  python setup.py build
  mkdir "$pkgdir/usr"
  python setup.py install --prefix "$pkgdir/usr"
}
