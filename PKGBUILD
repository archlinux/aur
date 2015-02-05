# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=compiz-manager
pkgver=0.6.0
pkgrel=5
pkgdesc="Compiz Fusion Starter Program"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
makedepends=('setconf')
depends=('compiz-core>=0.6.0' 'xorg-utils')
conflicts=('compiz-manager-git')
source=("http://releases.compiz.org/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        'path.patch')
sha256sums=('7be0744801c0c55050b5c9da997f61a8be190b2e1fb528b84dac12faf904542e'
            'b3028dea7bb87915e924468d3a62fc71f57b737ed242dcc06af3f10367b776eb')
                           
prepare()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -Np0 -i "${srcdir}/path.patch"
	setconf compiz-manager WHITELIST '"nvidia intel ati radeon i810 fglrx"'
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 compiz-manager "${pkgdir}/usr/bin/compiz-manager"
}
