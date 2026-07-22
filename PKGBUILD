# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.7.2
pkgver="${_upstream_version//-/_}"
pkgrel=4
pkgdesc='Prevent AI-Slop: The Sober Raccoon is your local CodeRabbit: A Local-first repository governance assistant and code reviewer with deterministic review readiness'
arch=('x86_64')
# Marketing / product site (read about Sober). Source + releases: git.sovereign-society.org/Sober/sober
url='https://sober-dev.pages.dev'
license=('LSL-1.0')
depends=('tree-sitter')
provides=('sober')
conflicts=('sober')
source=("https://git.sovereign-society.org/Sober/sober/releases/download/v${_upstream_version}/sober_v${_upstream_version}_linux_amd64"
        "https://git.sovereign-society.org/Sober/sober/releases/download/v${_upstream_version}/SHA256SUMS")
sha256sums=('742de024440c432114fa436ebf26ce70f9918d5123f7284ec7c873dc17f2b94e'
            'e3ecdf2480022f9771e4f6e1b636c775fbd43f660caa61b8be57b678b0f7f0c5')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
