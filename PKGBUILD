# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=hamap
pkgver='2018.april.2'
pkgrel=1
pkgdesc='High-quality Automated and Manual Annotation of Proteins.'
arch=('any')
license=('custom')
url='ftp://ftp.expasy.org'
depends=('')
makedepends=('bash')
provides=()
path='/databases/hamap'
source=(
	'LICENSE'
        "$url$path/hamap.prf.gz"
        "$url$path/hamap_alignments.tar.gz"
        "$url$path/hamap_rules.dat"
        "$url$path/hamap_seed_alignments.tar.gz"
        "$url$path/rules_index.dat"
        )
md5sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p  "$pkgdir/opt/$pkgname/"
  rm -f *.gz *.tgz
  find * -maxdepth 0 -regex '.+\.gz|.+\.tgz|LICENSE' -prune -o -print0 | xargs -0 -i cp -rfLH {} "$pkgdir/opt/$pkgname/"
}
