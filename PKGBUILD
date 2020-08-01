#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-smc-malayalam
pkgver=19.6
pkgrel=2
pkgdesc="Fonts for Malayalam released by Swathanthra Malayalam Computing"
url="http://smc.org.in/fonts/"
license=('custom:OFL')
conflicts=('ttf-malayalam-fonts-meta'
	'ttf-malayalam-font-anjalioldlipi'
	'ttf-malayalam-font-chilanka'
	'ttf-malayalam-font-dyuthi'
	'ttf-malayalam-font-keraleeyam'
	'ttf-malayalam-font-meera'
	'ttf-malayalam-font-rachana'
	'ttf-malayalam-font-raghumalayalamsans'
	'ttf-malayalam-font-suruma'
	'ttf-malayalam-font-manjari')
arch=(any)
source=("LICENSE.txt"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-rachana/fonts-smc-rachana_7.0.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-meera/fonts-smc-meera_7.0.3-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-manjari/fonts-smc-manjari_1.710-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-anjalioldlipi/fonts-smc-anjalioldlipi_7.1.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-suruma/fonts-smc-suruma_3.2.3-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-raghumalayalamsans/fonts-smc-raghumalayalamsans_2.2.1-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-dyuthi/fonts-smc-dyuthi_3.0.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-keraleeyam/fonts-smc-keraleeyam_3.0.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-uroob/fonts-smc-uroob_2.0.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-chilanka/fonts-smc-chilanka_1.400-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-karumbi/fonts-smc-karumbi_1.1.2-1_all.deb"
	"http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-smc-gayathri/fonts-smc-gayathri_1.100-1_all.deb")

md5sums=('55fa571b7e08283f24c93621194373c7'
	'4813938891b1dc1031ee9436f5de3bbd'
	'af2347adf1cd5e9672ce226cf5a8c8cd'
	'ab4bbab66318664bfdedbced1d16f9ad'
	'3d655baae4f4b23f10290055c5d87faa'
	'838c2bcebcd1d52b29b07dc568111fad'
	'f2da79691cd09b42e919e49b332e6f1a'
	'68a42e23c72729a901491a33cb177176'
	'e37787b9449140dbf2469c2c8081edff'
	'72815a33de8bd293a365a4d1bb3c4a4b'
	'e8c97e23b0ed7778227ca921ceef7126'
	'28861cce73504c0e00e8bd3eb4d1b9a2'
	'f31e89b1235a8b0fe37d7fcfbfb71ff8')

noextract=("${source[@]##*/}")
prepare() {
	for i in "$srcdir"/*.deb;do bsdtar -xf "$i"; tar -xf "$srcdir/data.tar.xz"; done;

}
package() {
	
	install -d "$pkgdir/usr/share/fonts/TTF/malayalam"
	install -d "$pkgdir/usr/share/fonts/malayalam"
	install -d "$pkgdir/usr/share/doc/fonts-smc-malayalam"
	install -t "$pkgdir/usr/share/doc/fonts-smc-malayalam" -m644 "LICENSE.txt"
	install -t "$pkgdir/usr/share/fonts/TTF/malayalam" -m644 "$srcdir/usr/share/fonts/truetype/malayalam"/*.ttf
	install -t "$pkgdir/usr/share/fonts/malayalam" -m644 "$srcdir/usr/share/fonts/opentype/malayalam"/*.otf
}


