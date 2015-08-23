# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@linuxbbq.org>
# Contributor: slowpoke <mail+aur at slowpoke dot io>
_pkgname='quickswitch-for-i3'
pkgname='quickswitch-i3'
pkgver=2.2
pkgrel=4
pkgdesc="A python utility to quickly change to and locate windows in i3"
arch=(any)
url="https://github.com/proxypoke/quickswitch-for-i3"
license=('custom:WTFPL')
depends=('dmenu' 'python-i3-git')
options=(!emptydirs)
source=("https://github.com/proxypoke/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cf08f651c0fba42bf0ec1ddb25449193858c9a8634bd7fca2d98fa6331f40c42')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    #license
    install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
