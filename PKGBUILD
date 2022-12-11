pkgname=chatgpt-git
pkgver=r421.a57bad7
pkgrel=3
pkgdesc=" Lightweight package for interacting with ChatGPT's API by OpenAI. Uses reverse engineered official API. "
arch=('x86_64')
url="https://github.com/acheong08/ChatGPT"
license=('GPL2')
makedepends=('git' 'python-setuptools' 'python-pip')
source=("$pkgname::git+https://github.com/acheong08/ChatGPT")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  pip install --prefix "$pkgdir/usr" .
}
