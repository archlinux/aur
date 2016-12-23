# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@linuxbbq.org>
# Contributor: slowpoke <mail+aur at slowpoke dot io>
_pkgname='quickswitch-for-i3'
pkgname='quickswitch-i3'
pkgver=2.6.0
pkgrel=1
pkgdesc="A python utility to quickly change to and locate windows in i3"
arch=(any)
url="https://github.com/OliverUv/quickswitch-for-i3"
license=('custom:WTFPL')
depends=('dmenu' 'python-i3-git')
options=(!emptydirs)
source=("https://github.com/OliverUv/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d1a081d9523e302b781d474d4806021122a3b8a1d8e486bae46f3409d4400e8a')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    #license
    install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
