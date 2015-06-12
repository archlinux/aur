# Maintainer: si_kabayan <aaizap4p at gmail dot com>
pkgname=opmin
pkgver=4.5.33867
pkgrel=1
arch=('any')
pkgdesc="Low Bandwidth Mobile Web Browser"
url="http://www.opera.com/en/mobile"
license=('custom')
depends=('microemulator' 'desktop-file-utils')
install=${pkgname}.install
source=('opmin.desktop'
	    'opmin.launcher'
	    'opmin.zip'
        'LICENSE'
        "http://mini.opera.com/download-7/opera-mini-$pkgver-advanced-en.jar")
noextract=("opera-mini-$pkgver-advanced-en.jar" 'opmin.zip')
sha512sums=('d607599b9ac20522e40093d6dc1597fe0520fbde4f818f9de5ce38ae531da31b31a0d887d36a03fe3ac9a5644b215afbe1a892486e48f3082b1b3ca67af5bc9e'
            'fa5b2f8801357073354001c16ba732b5f3bcb83a5f022f93e7ba7706f7ecd90ddcc1d119a1f33b52ce6eaa1820c33eb7d06e209eda0a94c4f214ff2638b94016'
            '45cde4a416221b00fa20450540025ac5d52102a5fc301a06f0e2c859dad5fba8a7bb76ff217fea23141eb45847dfe76988ea6d0caf6969475ab7dd88614b6e4a'
            'a7b055a1740babd894fe939653a89cf72e87018fb5f096ffed4f1fd2498149377e2a56787e5e838d40442d0ce5bf309d2e38953d6a3ab8ec094a176de4c69302'
            'a71d45f19bd4e54ece45b052994431f2de490b14c4acd276b50a0e956a9d5dca80285ca2630372688fd039d8cce478af09d85ccfdf07fd6860fca520374cc97e')
package() {
  cd $srcdir
  mkdir -p "$pkgdir"/usr/share/java/microemulator/apps/
  mkdir -p "$pkgdir"/usr/share/java/microemulator/devices/ 
  mkdir -p "$pkgdir"/usr/share/applications/
  install -Dm644 opera-mini-$pkgver-advanced-en.jar "$pkgdir"/usr/share/java/microemulator/apps/
  install -Dm644 opmin.zip "$pkgdir"/usr/share/java/microemulator/devices/
  sed -e "s/latest/$pkgver/" -i opmin.launcher
  install -Dm755 opmin.launcher "$pkgdir"/usr/bin/opmin
  install -Dm644 opmin.desktop  "$pkgdir"/usr/share/applications/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
