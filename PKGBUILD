# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=chkuuid
pkgname=$pkgbase
pkgver=1.1
pkgrel=1
_remotepkgbase=$pkgbase-git
_remotepkgrel=1
_gitname=chkuuid
_gittag="v${pkgver}"

pkgdesc="Compare the UUID of each partition with those found in FSTAB."

arch=('x86_64')

conflicts=('chkuuid-git')

url="https://github.com/daltomi/$_gitname"

license=('GPL3')

depends=('udev' 'libutil-linux') 

source=("$url/releases/download/v$pkgver/$_remotepkgbase-$pkgver-$_remotepkgrel-x86_64.pkg.tar.xz"{,.sig})

sha256sums=('5916bc4232315e0747bf39d97f81093d9df38b39638122cf862e33a3bdbef756'
            'SKIP'
           )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

package() {
        install -Dm755 "$srcdir/usr/bin/chkuuid" "$pkgdir/usr/bin/chkuuid"
}

#  vim: set ts=8 sw=8 tw=500 et :
