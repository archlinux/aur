# Maintainer: 企鹅2035 <qie2035@qq.com>

pkgname=netleak-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Kernel-level, proxychains-like tool for per-process traffic redirection on Linux (cgroup v2 + eBPF)'
arch=('x86_64' 'aarch64')
url='https://github.com/MuriloChianfa/netleak'
license=('MIT' 'GPL-3.0-only')
depends=('glibc')
provides=('netleak')
conflicts=('netleak')
source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://github.com/MuriloChianfa/netleak/releases/download/v${pkgver}/netleak-${pkgver}-1.fc40.x86_64_fedora-40-x86_64.rpm")
source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::https://github.com/MuriloChianfa/netleak/releases/download/v${pkgver}/netleak-${pkgver}-1.fc40.aarch64_fedora-40-aarch64.rpm")
sha256sums_x86_64=('f452aaedb4cd9d48f404cc9a7c34cf028b934083948027e0d4ac9ec810d2d46f')
sha256sums_aarch64=('8a0b8771906f6d0fedc7dcab067de94ac3028b85ef8eb01185827e9418306d7a')

package() {
	install -Dm755 usr/bin/netleak -t "${pkgdir}/usr/bin"
	install -Dm644 usr/lib/netleak/netleak.o -t "${pkgdir}/usr/lib/netleak"
	install -Dm644 usr/share/doc/netleak/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 usr/share/doc/netleak/LICENSE-GPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL"
}
