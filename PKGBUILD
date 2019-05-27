# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=chkuuid
pkgname=$pkgbase
pkgver=1.2
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

sha256sums=('a672aead5d0e13b0a925b022b54a4d1e8f6d83df8c96858e2c01112535bf09e9'
            'SKIP'
           )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

package() {
        install -Dm755 "$srcdir/usr/bin/chkuuid" "$pkgdir/usr/bin/chkuuid"
}

#  vim: set ts=8 sw=8 tw=500 et :
