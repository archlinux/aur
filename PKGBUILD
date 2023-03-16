# Maintainer: Duncan Russell <duncan at anomalocaris dot xyz>

pkgname=handlr-regex-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Fork of handlr with regex support"
arch=("x86_64")
url="https://github.com/Anomalocaridid/handlr-regex"
license=("MIT")
depends=('gcc-libs')
provides=(handlr)
conflicts=(handlr)
source=("handlr-${pkgver}::${url}/releases/download/v${pkgver}/handlr"
	"handlr-${pkgver}.sh::${url}/raw/v${pkgver}/assets/completions/handlr"
	"handlr-${pkgver}.fish::${url}/raw/v${pkgver}/assets/completions/handlr.fish"
	"_handlr-${pkgver}::${url}/raw/v${pkgver}/assets/completions/_handlr"
	"README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
	"LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
b2sums=('3d4359a10154fc2f223371f248d2668dd67e36c8fa527e84206e35cf049a38ee8aa244d4a8aa6e1e217d20cdb603dd5de02025c352de742429a9cd0f66e189cc'
        '26093361d5ee1f02c38ee2fb86a636e4f99ed8b3973ef0f7711b18fa24d0435e6cd006ebf67b25f98b7f78861c2234f5ebdf08fa2eff495e6b66fa1d7e3aea7d'
        '6638534f06bab0f80f873e57c61ee1870db688953c60bff30e3b4ab2eaaf823446b9b4ab16683325b2f1b2d44f407692e36c7a4c804b3699a89539e857ae00f4'
        '0c2beba271f600d2c305a47a0b4ddfbe8570d6d272ca0b0686de426f33caea45222058f350045419bfa86239dfef396e5cebc6f4a34f82d891e9efad7e8287df'
        'e720db0f8d271db6dc42f030ee204365ddd0aaef34f6f2b78e10f376acb131b67ae9ece303962eb754cdea19b5a1db4c9aec280704c22c56d0caed2b468915e4'
        'e1eccfbbf3bf9280aa0f6139414cb9375d497dd10aca1ae8ab8283390eea597d2204615c3d1823391af7e1febac23cfb23bfa4301f2ff976f8070c6e7c2b6d72')

package() {
	install -Dm 755 "handlr-${pkgver}" -t "${pkgdir}/usr/bin/handlr"
	install -Dm 755 "handlr-${pkgver}.sh" -t "${pkgdir}/usr/share/bash-completion/completions/handlr"
	install -Dm 755 "handlr-${pkgver}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/handlr.fish"
	install -Dm 755 "_handlr-${pkgver}" -t "${pkgdir}/usr/share/zsh/site-functions/_handlr"
	install -Dm 644 README-${pkgver}.md -t "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE-${pkgver} -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
