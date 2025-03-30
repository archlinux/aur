# Maintainer: witt <1989161762 at qq dot com>
pkgname=('otf-apple-pingfang' 'otf-apple-pingfang-relaxed' 'otf-apple-pingfang-ui')
pkgver=3.0.1
pkgrel=1
pkgdesc='Apple公司的苹方字体合集，由网友二次修改，收集自网络.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
makedepends=('tar')
source=(
    "https://github.com/witt-bit/applePingFangFonts/releases/download/${pkgver}/pingFang-20.0d4e1.tar.gz"
    "https://github.com/witt-bit/applePingFangFonts/releases/download/${pkgver}/pingFangRelaxed-19.0d5e3.tar.gz"
    "https://github.com/witt-bit/applePingFangFonts/releases/download/3.0.1/pingFangUI-20.0d15e3.tar.gz"
)
sha256sums=('0215ed14d69e3faecd3754ead14265d488b8fbea891a23ca1a93f7f5bdd02aa5'
            'cf1d3c696c6a73ea550b8f156caa7938ffd88bf5f99a558c71b6862f6be5e003'
            '1246b6a54ef7a0ddf1ce02da76d9ec9fcc03d948b7c6258dbeae93815e427f80')

package_otf-apple-pingfang(){
    pkgdesc="Apple公司出品的苹方字体"
    arch=('any')
    conflicts=('ttf-pingfang' 'ttf-pingfang-git')
    provides=('otf-apple-pingfang' 'pingfang' 'pingfang-fonts')
    cd "${srcdir}/pingFang";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/pingFang/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/pingFang/"{} \;
}

package_otf-apple-pingfang-relaxed(){
    pkgdesc="开苹方字体"
    arch=('any')
    conflicts=('ttf-pingfang-relaxed' 'ttf-pingfang-relaxed-git')
    provides=('otf-apple-pingfang-relaxed')
    cd "${srcdir}/pingFangRelaxed";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/pingFangRelaxed/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/pingFangRelaxed/{}" \;
}

package_otf-apple-pingfang-ui(){
    pkgdesc="苹方UI字体"
    arch=('any')
    conflicts=('ttf-pingfang-ui' 'ttf-pingfang-ui-git')
    provides=('otf-apple-pingfang-ui')
    cd "${srcdir}/pingFangUI";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/pingFangUI/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/pingFangUI/{}" \;
}
