# Contributor: Igor Belov <ivbelov@gmail.com>
# Contributor: Dennis Borisevich/denspirit <elfmax@tut.by>
# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=stardict-full-eng-rus
pkgver=2.4.2
pkgrel=9
pkgdesc="Large English-Russian dictionary for Stardict"
license=('GPL-2.0-only')
optdepends=(
    'stardict: to use the dictionary'
    'goldendict: to use the dictionary'
)
url='https://sourceforge.net/projects/xdxf/'
_base_url="${url}/files/dicts-stardict-form-xdxf/"
source=("${_base_url}/002c/stardict-comn_sdict05_eng_rus_full-${pkgver}.tar.bz2")
_source_dir_name="stardict-eng_rus_full-$pkgver"
sha256sums=('1a6d0aa6abc594f9f8fc8f4938637173267e9e54e534e2ecfbc672b7f284dcbb')
arch=(any)

package() {
    cd "$_source_dir_name/"
    install -dm 755 "${pkgdir}/usr/share/stardict/dic/"
    install -m 644 \
        eng_rus_full.dict.dz eng_rus_full.idx eng_rus_full.ifo \
        "${pkgdir}/usr/share/stardict/dic/"
}
