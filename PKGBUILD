# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=kubeeye-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='KubeEye aims to find various problems on Kubernetes, such as application misconfiguration, unhealthy cluster components and node problems.'
arch=('x86_64')
url='https://github.com/kubesphere/kubeeye'
license=('Apache 2')
provides=('kubeeye-bin')
source=("https://github.com/kubesphere/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64.tar.gz"
        "https://raw.githubusercontent.com/kubesphere/${pkgname%-bin}/v${pkgver}/LICENSE"
)
sha256sums=('41d2bb5c339d6a9447fab6224183c7eef9ce0a203fe9b7142cb643f9f693808a'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
    cd "${srcdir}"
    install -Dm755 "ke" "${pkgdir}/usr/bin/ke"
    install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
