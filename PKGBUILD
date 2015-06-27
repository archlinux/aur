# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Florian Plaza Oñate <florian.plaza gmail com>

pkgname=analysesi
pkgver=0.76
pkgrel=1
pkgdesc="Java Entity Relationship Model application"
arch=('any')
url="https://launchpad.net/$pkgname"
license=('GPL2')
depends=('bash' 'java-runtime')
source=(http://code.launchpad.net/$pkgname/trunk/$pkgver/+download/analyseSI-$pkgver.jar
        analysesi
        analysesi.svg
        analysesi.desktop)
noextract=(analyseSI-$pkgver.jar)
sha512sums=('dda4254b722da2e87a6d4dd7e7389ed8b1baae8361076a507751123fa6f72f0de1f8ca1db8c4c46a4e0f2744adeea40475c9dd85f014d1643abece3ac153bc0a'
            '40c75031738d6290a7bb82cb2a7784f8eda45bd162b6d8ffe9e49cefc105ccc6170509da05d4ec96cc06c25f62ae7cc4368d0c7c47a477a9931f150e589f29f5'
            '51a7b864b13e19218ebadcc752254e4f1bb7c2864b11bc27482a10ec2450ad39b74eab0c423d33b655dd5f2da02e88bbe2f708df833a2d56bf38daee7d3dccdb'
            'b4224f325ee91e898de78db3c5d87a328a890da0c2361cc9e268d270798dcf1ea8bd59d0cdd313b578856438e546a04387db5864cf5b560d88f944b176615a5e')

package() {
 install -D analyseSI-$pkgver.jar "$pkgdir"/usr/share/$pkgname/analyseSI-$pkgver.jar
 install -D $pkgname.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
 install -D $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
 install -D -m755 $pkgname "$pkgdir"/usr/bin/$pkgname

 sed -e "3 i ANALYSE_VER=$pkgver" -i "$pkgdir"/usr/bin/$pkgname
}

