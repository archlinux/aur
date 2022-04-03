# Maintainer: Duncan Russell <duncan at anomalocaris dot xyz>

pkgname=handlr-regex-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Fork of handlr with regex support"
arch=("x86_64")
url="https://github.com/Anomalocaridid/handlr-regex"
license=("MIT")
depends=('gcc-libs')
provides=(handlr)
conflicts=(handlr)
source=("handlr-${pkgver}::${url}/releases/download/v${pkgver}/handlr"
        "handlr-${pkgver}.sh::${url}/raw/v${pkgver}/completions/handlr"
        "handlr-${pkgver}.fish::${url}/raw/v${pkgver}/completions/handlr.fish"
        "_handlr-${pkgver}::${url}/raw/v${pkgver}/completions/_handlr"
        "README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
b2sums=('422ec37330bd5c4972147eb5218f95f7566a1a6a046719fc8b532e29cc9b8be203e339776d1be967ecebc340822511e4c436c34d103721d44e696ffc65477f33'
        '6b9fcdead736cad55a56d9a06c9f0fab3cc5e420791a795735777a3dc8dc0f38d61130847f2480a35e37a6c9700a7915e89935f9a67046a85c72d8b25c1bfe4f'
        'b0c86a7d3337ea3228cf0c689b7dafd0683b1a79e9cf45d56190945bc5ab544d5b6ca9844dfbc3e0777422e2af42cfaf4547fe06c70f15b2901c0efb8ebeaf80'
        'c1b407d96678fe33622b06780a21f2f37166e1056e9cde164fa16436e54c0b3389627290943a29e0472a198388a375060f71f2e8f3a1a794ceae46611543e5d4'
        'ec79306e56b2c931a32c8ad236ad0011f40fec2d294b0db379f95627737cae91c688548fe92de8416a5c7141a9400f0e131211fe8755488071d3b1c9074e12ba'
        'e1eccfbbf3bf9280aa0f6139414cb9375d497dd10aca1ae8ab8283390eea597d2204615c3d1823391af7e1febac23cfb23bfa4301f2ff976f8070c6e7c2b6d72')

package() {
  install -Dm 755 "handlr-${pkgver}" -t "${pkgdir}/usr/bin/handlr"
  install -Dm 644 README-${pkgver}.md -t "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 LICENSE-${pkgver} -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "handlr-${pkgver}.sh" -t "${pkgdir}/usr/share/bash-completion/completions/handlr"
  install -Dm 755 "handlr-${pkgver}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/handlr.fish"
  install -Dm 755 "_handlr-${pkgver}" -t "${pkgdir}/usr/share/zsh/site-functions/_handlr"
}
