# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.156
pkgrel=1
epoch=1
pkgdesc="Discord using system provided ${_electron} for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('LicenseRef-custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electron}" 'libxss')
makedepends=('asar'
             'jq'
             'python-pyelftools' # Required for Krisp patcher
             'python-capstone') # Required for Krisp patcher
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discord.com/terms'
        'OSS-LICENSES.html::https://discord.com/licenses'
        'discord-launcher.sh'
        'krisp-patcher.py'

        # Discord modules (from 'curl "https://updates.discord.com/distributions/app/manifests/latest?channel=stable&platform=linux&arch=x64"')
        "core-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/full.distro"
        "discord_desktop_core-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_desktop_core/1/full.distro"
        "discord_zstd-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_zstd/1/full.distro"
        "discord_krisp-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_krisp/1/full.distro"
        "discord_rpc-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_rpc/1/full.distro"
        "discord_utils-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_utils/1/full.distro"
        "discord_voice-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_voice/1/full.distro"
        "discord_game_utils-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_game_utils/1/full.distro"
        "discord_erlpack-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_erlpack/1/full.distro"
        "discord_modules-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_modules/1/full.distro"
        "discord_spellcheck-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_spellcheck/1/full.distro"
        "discord_dispatch-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_dispatch/1/full.distro"
        "discord_cloudsync-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_cloudsync/1/full.distro"
        "discord_arborium-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_arborium/1/full.distro")
sha512sums=('2e4d8999c81a82ee50ef2b39585b1b1f293a522ee5d751d38839c6a38e1e833117b70fab565f53959710e923562354b2193c769c75a1edad7e2f82c87adcf4bc'
            '2590151db4404a9ecbae2c45269c74f5ea26479967de5bc0b221a9143f4efeeeda9e335c23cf1f982680ab4fd895dcf3fd5731bd230908b3b2568eee0ec223ec'
            '5cccf397a772fed0db9b19253e496e78af27810227325ce681de985e2e0fbbdb195873d9642574ad3ae7bfcf4699bfdaa16933ca50c13cb98a1ff53c86c6de05'
            'd5373e2b2e9754bdcdbcda81fc1392ce6605939651839868823f3c3e0bf16f6fba2fb73bc1a0ff230eebd743d1463f2e8b2295503248f14845b3a56e57385bd1'
            '85da93530b2b92faad58cc84d0f7ddaea6b22fbec413e806c1981eb6369a301ec995eee6bfbe6b828e2cd0baf6168e578bbde456f2450a13199994ff9a1e7cd0'
            '0445d14932e27cf19f7f0a146c95f380201833ade15839a9cc2e9208051f2e6aebe7a589651691043600efc9682078ac7cb999bf69749d1cc14bb628b0a71e55'
            '821cadf85277c536e144bdb8f35c8cd22fc8a37bee4b1e15f3ff23f51154af0c2ec9f727f33ded802b312bdada5d72cfd0a3add0dcc85a87d773b3c1f66ef1ba'
            'c5d4f88d0c1494e2864a11082ec740102dbc01e011f1a7a6b6ba70245214df2bf51bcbb565a73c084ca369732f0ed80fae9c372abf4f7563f553b883de260c61'
            'ec756773321c855c5a3249bbbabddb4fa8c00801045c1b70e9fb72565271d3e9c2e0f06480de56c1de4e2671fbba2d293fb0331c909526cb86e086195e7137b9'
            'c9e16b77166d7f23ec127459f982d43b6678cd0a8c14ec4ed3875c13fab137b55aa429df8ad9cb6acc2f3491d716be54656e3dd135f894a9ed7950990da8cbcd'
            '714ac5970ab9a9578e345ac3e170104b1cc659fa3bc63fe20944248fac65bb191228a1058847055ef1a22b1ab1c48212904dede5b5d57e2e7182489ad197ac9d'
            '6ca180e8a9e0bdfb791226c4bd3e46db86b281e489b180d7298378071a767c265ffd8280a8f84adaa26941bc508183ff42335822f59fb39fb36601b0045d208c'
            '81722a341adf7a77f9d0722b4621d14020e9c53ea7acb6fc01eb8ccd188c2815c4a608f68720d786630e91c7a9949f5a8691eb69778a537ca3e072a704059c80'
            '0a0f629ab5ef98c997cac920f6d0b7fe4e24a412a4ea986820731dda6a9d402dd4028a08b92fc97d9bd1c2a3bc8389e94ffbab286e3c8ee414d816fb199d450d'
            '8f9c1595e072f5cd0cf1922f8a7a4d2e1321530db95d1e3a38471f681c6de13c0fe2353e6620015e3b4558ac6dcfb317acbee364cf0536f41ea6bcd28e8602cc'
            'b02ebf7f5ac5cf043f8669cc9086a3c96dff9324bf07282995a78432ea4be5a50c5dc96e945a9962a5d8eea3657133b7cfb67c2afb74af84ebdcfa2d2499a629'
            '3ca5acdcf98fbab2277d8aa4dc57e39245d27dd28cf6199213dbb94ece356a1181c5632f7917eb9f8a44a43cefc63035594882ef2407c8ca4acd087d745eb39b'
            'c4c36eb655b0949b5a31ec353bb597298b40709b3e9a579dc43b006622483a18856ccba806fd4543d11be041b96726b50b1761bc4604f8e7dbb5f22b7ef6f3c2'
            '3fb4db969c87c7178951fefacce5ae53a42e545fd2979a3056bd9662765dd3e31fe5961e32e42146e5ae2ebb12a9ccdcf9a32cf5ad2efb51f8362a05eb16e9dc')

# Skip "LICENSE.html" and "OSS-LICENSES.html" files hashes as they are unstable
# Since "updpkgsums"/"pkgctl version upgrade" overwrite the checksum array with
# literal hashes, set them to SKIP with indexed assignments (pacman-contrib#119)
# https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
sha512sums[1]='SKIP'
sha512sums[2]='SKIP'

# Colored makepkg-like functions
_all_off="$(tput sgr0)"
_bold="${_all_off}$(tput bold)"
_blue="${_bold}$(tput setaf 4)"
_red="${_bold}$(tput setaf 1)"
msg_blue() {
  printf "${_blue}  ->${_bold} $1${_all_off}\n"
}
error() {
  printf "${_blue}==>${_red} ERROR:${_bold} %s${_all_off}\n" "$1" >&2
  exit 1
}

prepare() {
  msg_blue "Extracting core-${pkgver}.tar.br"
  tar -xf core-${pkgver}.tar.br --use-compress-program=brotli --one-top-level=core --strip-components=1 files/

  for module in discord_*.tar.br; do
    msg_blue "Extracting ${module}"
    tar -xf "${module}" --use-compress-program=brotli --one-top-level="modules/${module%%-*}" --strip-components=1 files/
  done

  # prepare launcher script
  sed -i -e "s|@PKGNAME@|${_pkgname}|" \
    -e "s|@ELECTRON@|${_electron}|" \
    discord-launcher.sh

  # fix the .desktop file
  sed -i -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop
}

build() {
  msg_blue 'Patching app.asar to use system electron'

  asar e core/resources/app.asar core/resources/app
  rm core/resources/app.asar
  sed -i \
    -e "s|^Exec=\${exePath}$|Exec=/usr/bin/${_pkgname}|" \
    -e "s|^Name=\${appName}$|Name=${_pkgname^}|" \
    -e "s|^Icon=\${iconPath}$|Icon=${_pkgname}|" \
    -e "s|resourcesPath=path_1\.default\.join(require\.main\.filename,\"\.\.\",\"\.\.\"),|resourcesPath='/usr/share/${_pkgname}/resources',|" \
    -e "s|process\.resourcesPath|'/usr/share/${_pkgname}/resources'|g" \
    core/resources/app/bundle.js
  sed -i -e "s|process\.resourcesPath|'/usr/share/${_pkgname}/resources'|" core/resources/app/splashScreenPreload.js

  # This is required to properly show the window icon under wayland
  jq ".desktopName = \"${_pkgname}.desktop\"" core/resources/app/package.json > tmp.json
  mv tmp.json core/resources/app/package.json

  asar p core/resources/app core/resources/app.asar
  rm -rf core/resources/app

  # Set the newUpdater key to false in build_info.json in order to disable the new Discord updater (released on 2026-05-04, version 1.0.136),
  # Also add a localModulesRoot key that points to the Discord modules we're packaging.
  jq ".newUpdater = false | .localModulesRoot = \"/usr/share/${_pkgname}/modules\"" core/resources/build_info.json > tmp.json
  mv tmp.json core/resources/build_info.json

  msg_blue 'Patching Krisp to run with system electron'
  # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
  python krisp-patcher.py "modules/discord_krisp/discord_krisp.node" \
    || error 'Krisp patcher failed. You can comment it out in the PKGBUILD, but Krisp will not work.'

  # Krisp fails to initialize if this directory is not present (or if can't be created). Logs:
  #   [MediaEngineStore] Failed to load Krisp module: Failed to setup Krisp module, error code: -4
  #   [AVError] AV error reported: noise-canceller-error {"underlyingError":"NoiseCancellerError.KRISP_INIT_ERROR_GLOBAL_INIT"}
  mkdir -p "modules/discord_krisp/KMS/logs"
}

package() {
  # create necessary directories
  install -d "${pkgdir}/usr/share/${_pkgname}"

  # copy relevant data
  cp -r core/resources/ "${pkgdir}/usr/share/${_pkgname}/"
  cp -r modules/ "${pkgdir}/usr/share/${_pkgname}/"

  # intall icon and desktop file
  install -Dm 644 ${_pkgname^}/$_pkgname.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm 644 ${_pkgname^}/$_pkgname.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # install the launch script
  install -Dm 755 discord-launcher.sh "${pkgdir}/usr/bin/${_pkgname}"

  # install licenses
  install -Dm 644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  install -Dm 644 OSS-LICENSES.html "${pkgdir}/usr/share/licenses/${pkgname}/OSS-LICENSES.html"
}
