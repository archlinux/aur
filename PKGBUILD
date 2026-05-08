# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluserxg
pkgver=1.0
pkgrel=2
pkgdesc="A small and somewhat experimental GM/XG soundbank for many styles of music."
arch=('any')
license=("custom")
url="http://www.schristiancollins.com/generaluser.php"
groups=('soundfonts')
source=("https://github.com/kode54/SFE/raw/16be1d528b46263dbc707653fabe5c20264785c0/reference_implementation/GeneralUserXG-SFeTest.sf4"
	"https://github.com/kode54/SFE/raw/d9bd2f8cc4efd53b9a6fd89da275867b152f6b71/reference_implementation/tg300b.sflist.json"
        "https://github.com/kode54/SFE/raw/aa883cee9701a6d9f45c25a8d95284605c9c351f/reference_implementation/LICENSE.txt")
sha256sums=('828657262faa0404e6008e5bf80c1a357b466d1b74eed9911e884278b68e3d8b'
            'c4333b7b5aa6def06ecfac19c3c6fac5237ab2539cf374af4fd8579099fdf132'
            '51c70c28699d1b095e2fe0e59247662685ba8838b06756cd8e8f5236d2db64ee')

package() {
  install -Dm644 "GeneralUserXG-SFeTest.sf4" "$pkgdir/usr/share/soundfonts/GeneralUserXG.sf4"
  sed 's/GeneralUserXG-SFeTest/GeneralUserXG/' 'tg300b.sflist.json' > "$pkgdir/usr/share/soundfonts/GeneralUserXG-TG300B.sflist.json"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

