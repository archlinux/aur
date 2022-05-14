# Maintainer: Eris Nihila <sp0t1fyfr33tr1alabus3@outlook.com>
#
#

pkgname=aurtool-git
pkgver=1.0
pkgrel=5
pkgdesc="Minimal aur package management utility written in bash script"
arch=('any')
url="https://www.github.com/m1ndflay3r/aurtool"
license=('GPL-3.0')
depends=(
         'pacman-contrib'
         'm4'
         'gawk'
         'autoconf'
         'automake'
         'findutils'
         'binutils'
         'gettext'
         'bison'
         'sed'
         'file'
         'fakeroot'
         'flex'
         'gcc'
         'grep'
         'groff'
         'gzip'
         'libtool'
         'texinfo'
         'make'
         'pacman'
         'patch'
         'pkgconf'
         'sudo'
         'which'
         'git'
         'pacman-contrib'
)
optdepends=(
        'nano: for editing PKGBUILD during install'
        'vim: for editing PKGBUILD during install'
        'package-query: actually a required dependency, but moved to optdepends as aurtool installs it automatically on first launch'
)

package() {
        git clone https://github.com/m1ndflay3r/aurtool aurtool-git
        mv aurtool-git/aurtool .
        mv aurtool-git/resources/libaurtool .
        mv aurtool-git/README.md .
        mkdir -p "$pkgdir"/usr/bin
        mkdir -p "$pkgdir"/usr/include
        mkdir -p "$pkgdir"/etc
        install -m755 aurtool "$pkgdir"/usr/bin/aurtool
        install -m644 libaurtool "$pkgdir"/usr/include/libaurtool
        install -m644 README.md "$pkgdir"/etc/aurtool-readme.md
}
