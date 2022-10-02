# Maintainer: Jan Claussen <jan.claussen10@web.de>

pkgname=('webos-cli-minimal')
pkgver=6.0.1
pkgrel=1
pkgdesc='Just the LG WebOS command line cli tool'
arch=('x86_64')
url='http://webostv.developer.lge.com/sdk/installation/'
# TODO: Licence
license=('custom:LG Software Development Kit License Agreement' 'APACHE')
makedepends=('unzip')
conflicts=('webos-cli' 'webos-sdk' 'webos-ide')
source=(
  'local:///webOS_SDK_TV_Installer_linux64_min.zip'
  'cli.patch'
)
sha256sums=('SKIP'
            'd4c42c1e624290b507f4ef56b09aa128b65eba0c1fedda902129aae99690dc4f'
)

package_webos-cli-minimal() {

  unzip -o webOS_SDK_TV_Installer_linux64_min/webOS_SDK_TV_linux64.zip
  unzip -o webOS_SDK/webos_cli_tv.zip
  install -dm 755 "${pkgdir}"/usr/{bin,share/webOS_TV_SDK/CLI,share/licenses/webos-sdk}
  cd CLI
  patch --strip=1 --input="../cli.patch"
  cd ../
  cp -dr --no-preserve='ownership' CLI/LICENSE.txt "${pkgdir}"/usr/share/licenses/webos-sdk/
  cp -dr --no-preserve='ownership' CLI "${pkgdir}"/usr/share/webOS_TV_SDK/
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/node
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-device-info
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-extend-dev
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-generate
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-inspect
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-install
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-launch
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-novacom
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-package
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-server
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-setup-device
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares "${pkgdir}"/usr/bin/ares
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-device-info "${pkgdir}"/usr/bin/ares-device-info
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-extend-dev "${pkgdir}"/usr/bin/ares-extend-dev
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-generate "${pkgdir}"/usr/bin/ares-generate
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-inspect "${pkgdir}"/usr/bin/ares-inspect
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-install "${pkgdir}"/usr/bin/ares-install
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-launch "${pkgdir}"/usr/bin/ares-launch
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-novacom "${pkgdir}"/usr/bin/ares-novacom
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-package "${pkgdir}"/usr/bin/ares-package
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-server "${pkgdir}"/usr/bin/ares-server
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-setup-device "${pkgdir}"/usr/bin/ares-setup-device
}

