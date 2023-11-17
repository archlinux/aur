# Maintainer: Mekyt <hello at mek dot yt>

_pkgname='dagu'
pkgname='dagu-bin'
pkgver=1.12.7
pkgrel=2
pkgdesc='Cron alternative with a Web UI'
arch=('x86_64')
url='https://github.com/dagu-dev/dagu'
license=('GPLv3')
depends=()
makedepends=()
optdepends=()
source=(
    'config.yaml'
    "${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
    "dagu.service"
    "dagu-user.service"
    "dagu.sysusers"
)
backup=('etc/dagu/config.yaml')
sha512sums=('e2dd6709919653d1ee6d0ea8a90d7ee281d3ecec39969d76211eb2c02714dd1876e0b5892dc64ab1066e001af14eb7c88c5a030ea584bb10859d1dfb57f1abb7'
            '7f4ed1e86b8fe02c7a45892eaa9bebb6b7d5ebe73157514669e4ce8057ee7036f162c68bbae813ded048d214af9ff0694902c73ddba58e955d2c15bd2d1cfb41'
            'dc415884f19083a5c0b061b1e3cef7b0fc444d6398847effe9f5a1e0c8e2b1a5601e2afca5488bd7e5c67546c23c9323ef6eddf28132af0309c0d938eb67b642'
            '54dab28dbbbf967ed9238ccbfc5f8ff03c08601ffe8eff46c4ff4891d83ab6067fe7f7329c985716e37d02bb2d4d9d398c6f831906eabef0f89f1475a8ea530d'
            '66291290fb916e373d4124dc39e2fe07b3bdadc663f790c71266d56bb21e5519a21c5f62783796759a2bae85839a58d211741d89d45a316f2183a91f6cefbad3')

package() {
    install -Dm755 ${srcdir}/${_pkgname} -t "${pkgdir}"/usr/bin/
    install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${_pkgname}-user.service "${pkgdir}"/usr/lib/systemd/user/"${_pkgname}".service
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/"${_pkgname}".conf
    install -Dm644 config.yaml "${pkgdir}"/etc/dagu/config.yaml
}
