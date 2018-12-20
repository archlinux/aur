# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>
# Contributor: skydrome <irc.freenode.net>

_pkgname=enki-editor
pkgname=$_pkgname-git
pkgver=18.08.0.r3.g7ac303fc
pkgrel=1
pkgdesc="Text editor for programmers. Live preview in Markdown, reStructuredText and HTML"
arch=('any')
url="http://enki-editor.org/"
license=('GPL')
makedepends=('git' 'python')
#         'python-code-chat'
#         'qutepart'
depends=('flake8'
         'python-code-chat-git'
         'python-markdown'
         'python-pyparsing' 
         'python-qtconsole'
         'python-regex'
         'python-sphinx'
         'qutepart-git')
#            'python-pygments: Scheme preview'
optdepends=('ctags: navigation in file'
            'python-code-chat: source code to HTML translation (literate programming)'
            'python-docutils: reStructuredText preview'
            'python-markdown: Markdown preview'
            'tre: preview synchronization')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/hlamer/enki.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

