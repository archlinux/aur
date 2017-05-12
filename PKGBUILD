# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Florian Plaza Oñate <florian.plaza gmail com>

pkgname=analysesi
pkgver=0.80
pkgrel=1
pkgdesc="Java Entity Relationship Model application"
arch=('any')
url="https://launchpad.net/$pkgname"
license=('GPL2')
depends=('bash' 'java-runtime')
source=(https://launchpad.net/$pkgname/trunk/0.8/+download/AnalyseSI-$pkgver.jar
        analysesi
        analysesi.svg
        analysesi.desktop)
noextract=(AnalyseSI-$pkgver.jar)
sha512sums=('3543170b71d459dc05de1b559ec4ff374717c4d4d3609f3c961a05c04ff24ac1daf4044840acf351483908096d041d0baad92f2536f23e6fd4f4933c5c9024ee'
            'be454fdec3a0c80a6637234f5ded89143723560aabbb2f452e6ea799347f9b87b0daf06e521c35952f23b601394812c4340985253f27e14eb73e359ce066e43e'
            '51a7b864b13e19218ebadcc752254e4f1bb7c2864b11bc27482a10ec2450ad39b74eab0c423d33b655dd5f2da02e88bbe2f708df833a2d56bf38daee7d3dccdb'
            'b4224f325ee91e898de78db3c5d87a328a890da0c2361cc9e268d270798dcf1ea8bd59d0cdd313b578856438e546a04387db5864cf5b560d88f944b176615a5e')

package() {
 install -D AnalyseSI-$pkgver.jar "$pkgdir"/usr/share/$pkgname/AnalyseSI-$pkgver.jar
 install -D $pkgname.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
 install -D $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
 install -D -m755 $pkgname "$pkgdir"/usr/bin/$pkgname

 sed -e "3 i ANALYSE_VER=$pkgver" -i "$pkgdir"/usr/bin/$pkgname
}

