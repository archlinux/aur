# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>
# Contributor: zer0def <zer0def@github>

pkgname=luks-tpm
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility to manage LUKS keyfiles sealed by the TPM"
arch=('any')
url="https://github.com/electrickite/${pkgname}"
license=('GPL')
depends=('tpm-tools' 'trousers' 'cryptsetup' 'bash' 'coreutils' 'gawk' 'grep' 'util-linux')
install="${pkgname}.install"
backup=('etc/default/luks-tpm')

source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.hook")
sha256sums=('ce4b48bfdcd4ecc5df672bf7264fb5abb3aef4b271eec2a24657be396332e86a'
            '3b268c5e1d874d3b80698e3cfb245cccdfb6412cc6982a112812d7e3717b3b9d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 luks-tpm "${pkgdir}/usr/bin/luks-tpm"
  install -Dm644 default "${pkgdir}/etc/default/luks-tpm"
  install -Dm644 "${srcdir}/luks-tpm.hook" "${pkgdir}/usr/share/libalpm/hooks/luks-tpm.hook"
}
