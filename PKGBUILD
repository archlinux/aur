# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>
# Contributor: skydrome <irc.freenode.net>

pkgname=enki-editor-git
pkgver=20.03.1.r5.gaafee43a
pkgrel=1
pkgdesc="Text editor for programmers. Live preview in Markdown, reStructuredText and HTML"
arch=('any')
url="http://enki-editor.org"
license=('GPL2')
makedepends=('git' 'python')
#'python-pyparsing'
depends=('python-pyqt5-webengine'
         'python-qtconsole'
         'qutepart')
optdepends=('ctags: file navigation'
            'flake8: Python code lint '
            'python-code-chat: source code to HTML translation (literate programming)'
            'python-docutils: reStructuredText preview'
            'python-markdown: Markdown preview'
            'python-regex: synchronization preview '
            'python-sphinx: Sphinx documentation'
            'tre: synchronization preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/andreikop/enki.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

