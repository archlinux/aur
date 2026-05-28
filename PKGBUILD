# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=markdown
pkgdesc='A markdown parser for Ada.'
pkgver=27.0w
pkgrel=1

url='https://github.com/AdaCore/markdown'
arch=(i686 x86_64)
license=(Apache-2.0)

depends=(vss-text vss-extra)
makedepends=(gprbuild-toolbox)

_srcdir="${pkgname}-${pkgver}-20260409-168B4-src"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/markdown-src.tar.gz")
sha256sums=(ae46a445fa83b1b78dd97063e59657e6355326bda8692a2a9c62f6fe37adbb19)


build()
{
    cd "${srcdir}/${_srcdir}"

    make BUILD_MODE=prod all
}


package()
{
    cd "${srcdir}/${_srcdir}"

    make BUILD_MODE=prod \
         DESTDIR="${pkgdir}" \
         install

    install -Dm644 LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
