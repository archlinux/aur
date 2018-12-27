# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com >

pkgbase=librefox
pkgname=$pkgbase
pkgver=2.1
pkgrel=1

pkgdesc="Librefox: Browse With Freedom"

arch=('x86_64')

url='https://librefox.org/'

license=('Mozilla Public License Version 2.0')

source=("https://github.com/intika/Librefox/releases/download/Librefox-v${pkgver}-v64.0.0/Librefox-${pkgver}-Firefox-Linux-64.0.0-x64.tar.xz"
        "librefox"
        "librefox.desktop"
         )

sha1sums=('1d25c606e08e6ad2e674abf3032255902067a81d'
          'e2f2060a4b0ec0098cfc6a37fd3ce9f7c68bf755'
          'd1b7e2e2f2618b26bfecf6a524ee984b31e8d061'
          )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

package() {

        _usrshare="$pkgdir/usr/share"
        _usrlib="$pkgdir/usr/lib/librefox"
        _usrbin="$pkgdir/usr/bin/"
        _srcdir="$srcdir/Librefox-${pkgver}-Firefox-Linux-64.0.0-x64"

        mkdir -p {$_usrlib,$_usrbin,$_usrshare/applications}
        cp -R $_srcdir/* $_usrlib
        cp librefox.desktop $_usrshare/applications/
        cp librefox $_usrbin
        chmod +x $_usrbin/librefox
}
