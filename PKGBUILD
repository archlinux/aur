# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@linuxbbq.org>
# Contributor: slowpoke <mail+aur at slowpoke dot io>
_pkgname='quickswitch-for-i3'
pkgname='quickswitch-i3'
pkgver=2.7.0
pkgrel=5
pkgdesc="A python utility to quickly change to and locate windows in i3"
arch=(any)
url="https://github.com/OliverUv/quickswitch-for-i3"
license=('custom:WTFPL')
depends=('dmenu' 'python-i3-py')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/OliverUv/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ce6339e532a31f6cd13c17e99bcc42c9f60a43299536835af4ca4f42cd3f8f7b')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    #license
    install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
