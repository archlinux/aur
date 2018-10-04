# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=luks-tpm2
pkgver=0.3.0
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
sha1sums=('d001ceb76266949716792f77b608e6592630c66b'
          '3f0f166a469d71441d0a9d20320cea671119ef0b')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install files
  install -Dm755 luks-tpm2 ${pkgdir}/usr/bin/luks-tpm2
  install -Dm644 default ${pkgdir}/etc/default/luks-tpm2
  install -Dm644 ${srcdir}/luks-tpm2.hook ${pkgdir}/usr/share/libalpm/hooks/luks-tpm2.hook
} 
