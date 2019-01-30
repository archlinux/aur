# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=luks-tpm2
pkgver=1.0.1
pkgrel=1
pkgdesc="Utility to manage LUKS keys sealed by a TPM 2.0"
arch=('any')
url="https://github.com/electrickite/luks-tpm2"
license=('GPL3')
install="${pkgname}.install"
backup=('etc/default/luks-tpm2')
depends=('tpm2-tools'
         'cryptsetup'
         'bash'
         'coreutils'
         'util-linux'
         'grep')
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
        'luks-tpm2.hook')
sha1sums=('8fdb092441d13768653f9f668c05192714e20253'
          '6156622b538d8f78d2930bc85e91d3bfee5ebfb6')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install files
  install -Dm755 luks-tpm2 ${pkgdir}/usr/bin/luks-tpm2
  install -Dm644 default ${pkgdir}/etc/default/luks-tpm2
  install -Dm644 ${srcdir}/luks-tpm2.hook ${pkgdir}/usr/share/libalpm/hooks/luks-tpm2.hook
} 
