# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.153
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
        "discord_dispatch-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_dispatch/1/full.distro")
sha512sums=('7e9d2c92eeb088ce2264b665bbc4b91475332d79c8901dcb7a8284680e5ec754ca0eaede14006bf5c4abbd48543c804f8925f30614a2132540c6ac8350639a55'
            '2590151db4404a9ecbae2c45269c74f5ea26479967de5bc0b221a9143f4efeeeda9e335c23cf1f982680ab4fd895dcf3fd5731bd230908b3b2568eee0ec223ec'
            '5cccf397a772fed0db9b19253e496e78af27810227325ce681de985e2e0fbbdb195873d9642574ad3ae7bfcf4699bfdaa16933ca50c13cb98a1ff53c86c6de05'
            'd5373e2b2e9754bdcdbcda81fc1392ce6605939651839868823f3c3e0bf16f6fba2fb73bc1a0ff230eebd743d1463f2e8b2295503248f14845b3a56e57385bd1'
            '85da93530b2b92faad58cc84d0f7ddaea6b22fbec413e806c1981eb6369a301ec995eee6bfbe6b828e2cd0baf6168e578bbde456f2450a13199994ff9a1e7cd0'
            'f0361b667a29a2868ebb346c76b91e2be138375428521ab2e3df64e947cf239600acb3baae355bf72d3ff6a40f229c9216202c3a98846d273d3da7c3387f0a8d'
            '798dd9e8c224c7891db660da06f55e9f6ce0697843befa635ee8cf7c133da38ffb1682f645072f25ed02e7d311355c26088097e9a0d3da60d4dda4c71f0b0447'
            '4d083dbd969177af93c39255dcc31c5064f24cb28d0f5d5e298b5ccd2e65ec167ef123dbbc30d79cd373dbc488b09346c0310e73f8504573a2173b956c058b42'
            '2b8de3a2f83b9d290b6fea841371c4be1dbf76cf51d8316ad79e86d8de5710c8a62dad5367c831e005bdbfb85d9a03cb5d902e4ffd6e969d2e9bef456621e82a'
            'beb71f8fd2f03864f3d53e2e142e2f3d0f3f3aa54f95ef0a486e28a0bed1134789811f3243a55dfb72c5063d36ee30c9e617acb61d442bfb8c693615503d50ba'
            'c4235fe1b0a3072386094bcd30abee81188fbbb1ed92640e67daacd4c521aa483b13193e9b57e1b1cf0fdbf9d16f9c63bba1ec4a7c4214e423632c49141c158f'
            'd5f8365dbfa29778ee44a181a0c04c757a27ba4b644bb1d9b8c1a27e20d9b6d1709dce978c3491d95b11c789054d0d9857956f894d7af517585b3e52c61e2a66'
            '18cdde31f24c79eb73cd26dd08d6926062595da3e2f0bc65b60c32506725fcae1f416e84e5905e10a9494d81491e74fd0718a96902c09d6d9ca638577a89b94e'
            '20861bfdd2566f65cdfa0ddea559e2f33d592612256772c9d28b515ef5c0f144227689ca0f5bc31a3c9f744426d9cb475fb697552037931e0a7a6ca233b818c6'
            '144b39d1ddee0bf99aa63eb0b3cafd72d009f8da917ffc1cf90bf752262decce682400af7893b4506f021fa19a69d0bae3465127d1f7c67be337d644601d3313'
            '5f8dd07c2e6982582f673bee94e3e8717167eb996768d0ee611eb4a1c9d8e2bd077ff91c414da8b14c754e8a5107232d334a0cecb11fb9daa7f5d902f8b11b63'
            '96a32259debac11c590e9e3e139d6e04e356fd6fcf2e7631ab379f7fc09d247d881d773246a411839802608245efbd3bb2a4c94b89df1af9eacffa5cbb39751a')

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
