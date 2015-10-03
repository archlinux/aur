# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>
# Contributor: skydrome <irc.freenode.net>

_pkgname=enki-editor
pkgname=$_pkgname-git
pkgver=15.05.0.r51.g36975c8
pkgrel=1
pkgdesc="Text editor for programmers. Live preview in Markdown, reStructuredText and HTML"
arch=('any')
url="http://enki-editor.org/"
license=('GPL')
makedepends=('git' 'python2')
depends=('python2-pyparsing' 
         'qutepart-git')
#            'python2-pygments: Scheme preview'
optdepends=('ctags: navigation in file'
            'python2-code-chat: source code to HTML translation (literate programming)'
            'python2-docutils: reStructuredText preview'
            'python2-markdown: Markdown preview'
            'tre: preview synchronization')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::git://github.com/hlamer/enki.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

