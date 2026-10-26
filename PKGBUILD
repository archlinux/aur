# Maintainer: Romain Bertrand <romaintb@noreply.codeberg.org>
pkgname=fgj-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A command-line tool for working with Forgejo instances (including Codeberg.org) (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/romaintb/fgj"
license=('MIT')
provides=('fgj')
conflicts=('fgj')
source=("LICENSE-${pkgver}::https://codeberg.org/romaintb/fgj/raw/tag/v${pkgver}/LICENSE"
        "README-${pkgver}.md::https://codeberg.org/romaintb/fgj/raw/tag/v${pkgver}/README.md")
source_x86_64=("fgj-${pkgver}-x86_64::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_amd64")
source_aarch64=("fgj-${pkgver}-aarch64::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_arm64")
source_armv7h=("fgj-${pkgver}-armv7h::https://codeberg.org/romaintb/fgj/releases/download/v${pkgver}/fgj_linux_arm")
sha256sums=('aa9cc5b4501bafe72ecf5db0e1a01d9e2c740f942ef0e78a638d7329fac1ba90'
            '02c88ba55ef16ed11d34dd992dba58ea129c5639e75651f0f6a03c558f8a99d4')
sha256sums_x86_64=('185a789d1ace2690d2b44615fe8cc7b760b647aea48e8a4ce8a43695bf91a6f4')
sha256sums_aarch64=('33f3b8b656319ec8553b1d65d935ab7702610abc62ae080e9088aaa7ee7e33d0')
sha256sums_armv7h=('1675ba1a0c72a6497a2fcedb7a60cef128d17835a5a03577eccb78332e733847')

package() {
  install -Dm755 "fgj-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fgj"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
