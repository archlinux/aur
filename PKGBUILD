# Contributor: Igor Belov <ivbelov@gmail.com>
# Contributor: Dennis Borisevich/denspirit <elfmax@tut.by>
# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=stardict-full-rus-eng
pkgver=2.4.2
pkgrel=8
pkgdesc="Large Russian-English dictionary for Stardict"
license=('GPL-2.0-only')
optdepends=(
    'stardict: to use the dictionary'
    'goldendict: to use the dictionary'
)
url='https://sourceforge.net/projects/xdxf/'
_base_url="${url}/files/dicts-stardict-form-xdxf/"
source=("${_base_url}002c/stardict-comn_sdict05_rus_eng_full-${pkgver}.tar.bz2")
_source_dir_name="stardict-rus_eng_full-$pkgver"
sha256sums=('929c61475051d177e41c255c55259c6e0d0bba483dd3b3f2f25e739d86ffc104')
arch=(any)

package() {
    cd "$_source_dir_name/"
    install -dm 755 "${pkgdir}/usr/share/stardict/dic/"
    install -m 644 \
        rus_eng_full.dict.dz rus_eng_full.idx rus_eng_full.ifo \
        "${pkgdir}/usr/share/stardict/dic/"
}
