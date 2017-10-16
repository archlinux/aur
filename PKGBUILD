# Maintainer: Silvio Knizek <killermoehre@gmx.net>
_pkgname='purple-xmpp-http-upload'
pkgname="${_pkgname}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=r11.94bbea0
pkgrel=1
pkgdesc="HTTP File Upload plugin for libpurple (XMPP Protocol)"
arch=('i686' 'x86_64')
url="https://github.com/Junker/purple-xmpp-http-upload"
license=('GPL3')
groups=()
depends=('libpurple' 'glib2' )
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=('!buildflags')
install=
source=("${_pkgname}::git+https://github.com/Junker/purple-xmpp-http-upload.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
