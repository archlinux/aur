# Maintainer: witt <1989161762 at qq dot com>
pkgname=('otf-apple-pingfang' 'otf-apple-pingfang-relaxed')
pkgver=v2.12fa9ed
pkgrel=1
pkgdesc='Apple公司的苹方字体合集，由网友二次修改，收集自网络.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
makedepends=('git')
source=('git+https://github.com/witt-bit/applePingFangFonts.git')
sha256sums=('SKIP')

pkgver() {
    cd applePingFangFonts/;
    printf "v%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_otf-apple-pingfang(){
    pkgdesc="Apple公司出品的苹方字体"
    arch=('any')
    conflicts=('ttf-pingfang' 'ttf-pingfang-git')
    provides=('otf-apple-pingfang')
    cd "${srcdir}/applePingFangFonts/pingFang";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/pingFang/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/pingFang/"{} \;
}

package_otf-apple-pingfang-relaxed(){
    pkgdesc="开苹方字体"
    arch=('any')
    conflicts=('ttf-pingfang-relaxed' 'ttf-pingfang-relaxed-git')
    provides=('otf-apple-pingfang-relaxed')
    cd "${srcdir}/applePingFangFonts/pingFangRelaxed";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/pingFangRelaxed/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/pingFangRelaxed/{}" \;
}
