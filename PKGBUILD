# Maintainer: Eris Nihila <sp0t1fyfr33tr1alabus3@outlook.com>
#
#

pkgname=aurtool-zsh-git
pkgver=2.0_alpha.7
pkgrel=5
pkgdesc="A lightweight aur package management utility written in zshell"
arch=('any')
url="https://www.github.com/m1ndflay3r/aurtool-zsh"
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
         'zsh'
)
optdepends=(
        'nano: for editing PKGBUILD during install'
        'vim: for editing PKGBUILD during install'
        'package-query: actually a required dependency, but moved to optdepends as aurtool installs it automatically on first launch'
)
provides=(
        'aurtool'
        'aurtool-git'
)
conflicts=(
        'aurtool'
        'aurtool-git'
)

package() {
        git clone https://github.com/m1ndflay3r/aurtool-zsh aurtool-zsh-git
        mv aurtool-zsh-git/aurtool .
        mv aurtool-zsh-git/resources/libaurtool .
        mv aurtool-zsh-git/README.md .
        mkdir -p "$pkgdir"/usr/bin
        mkdir -p "$pkgdir"/usr/include
        mkdir -p "$pkgdir"/etc
#        zsh zcompile aurtool
#        echo '#!/usr/bin/env zsh' > compile.zsh
#        echo " " >> compile.zsh
#        echo "zcompile aurtool" >> compile.zsh
#        echo "zcompile libaurtool" >> compile.zsh
#        chmod 755 compile.zsh
#        ./compile.zsh
#        mv aurtool aurtool.bak
#        mv aurtool.zwc aurtool
#        zsh zcompile libaurtool
#        mv libaurtool libaurtool.bak
#        mv libaurtool.zwc libaurtool
        install -m755 aurtool "$pkgdir"/usr/bin/aurtool
        install -m644 libaurtool "$pkgdir"/usr/include/libaurtool
        install -m644 README.md "$pkgdir"/etc/aurtool-README.md
}
