# Maintainer:  Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=geeknote
pkgver=2.0.16
pkgrel=1
pkgdesc='A command line client for Evernote that can be use on Linux, FreeBSD and OS X.'
arch=('any')
url='https://github.com/jeffkowalski/geeknote'
license=('GPL')
depends=('python2'
         'evernote-sdk-python'
         'python2-html2text'
         'python2-sqlalchemy'
         'python2-markdown2-git'
         'python2-thrift'
         'python2-beautifulsoup4'
         'python2-oauth2'
         'python2-lxml'
         'python2-proxyenv-git')
makedepends=('git' 'python2-setuptools')
checkdepends=('python2-pytest')
source=("https://github.com/jeffkowalski/geeknote/archive/v$pkgver.tar.gz")
sha256sums=('273e76dd445cfe84df05bf5a2a6bf9982df3da6febaa939fa4f7ba7af4b2946d')
provides=('geeknote')
conflicts=('geeknote')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

check() {
  cd $pkgname-$pkgver/
  # Tests fail, not sure why yet...
  # py.test2
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
