# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=josm-stable
_name=josm
_app_id="org.openstreetmap.${_name}"
pkgver=23.02 # REMEMBER TO UPDATE CHANGELOG!
pkgrel=1
_commit_id=18678
pkgdesc="An editor for OpenStreetMap written in Java. Stable releases"
arch=('any')
url="https://josm.openstreetmap.de/"
license=('GPL')
depends=('hicolor-icon-theme' 'java-runtime>=11' 'ttf-font' 'sh')
conflicts=('josm' 'josm-tested')
provides=('josm')
makedepends=()
changelog=changelog
backup=('etc/conf.d/josm')
source=("https://josm.openstreetmap.de/download/${_name}-snapshot-${_commit_id}.jar"
        "${_name}.conf.d"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/applications/${_app_id}.desktop"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/man/man1/${_name}.1"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/metainfo/${_app_id}.appdata.xml"
        "https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg")

# adding icons to source list
for _icon in 8 16 22 24 32 36 40 42 48 64 72 80 96 128 192 256 512; do
    source_icons=("${source_icons[@]}" "${_icon}x${_icon}_${_app_id}.png::https://josm.openstreetmap.de/export/${_commit_id}/josm/trunk/native/linux/tested/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_app_id}.png")
done

source=("${source[@]}" "${source_icons[@]}")

noextract=(${_name}-snapshot-${_commit_id}.jar)
b2sums=('9db4a9bd90e0f2deac4474462091d91505874f936fde330c6a676d4beecf029966d692bc2dadc0f2d44bfcb53d8f40a075a95d0bb4b07f6ffffb160080d88ceb'
        '6ab22295febf20e8124da5f224d28722210345b33a091b948dd02e1897ab7767cdf6b65ee42bf777f3d52dfb88e14b7af9a013ee60e6949964618bb33416b6ee'
        'd3a5e0204d0188e72eed65e71edd079b5aa025b82f13c515605f7d5bb9f96fc93e4a24c9eea76c6c4027f54f1c449cda811f5c59e0f2ab54975ab3b1bf221ee7'
        '095c9a52e8efaf90a41d322c89cee6828ff05a20999a864f438e1b8c101382588e58f455f8339235493a27a16326b9114add69aeab9709e9bf8a28d1ce5594d5'
        '59eafa8c80f4ab55406ff909851fceacdd9c6f956017ead50bb3ee47c4d439f4e1e35406823a00f1654178244aec26be1f0de7703ea00cdda6d40cbf0b0d9235'
        'b0ec92c4e97500d5461200f698fbfccc53c275169c25db3139a4c97826fffa96ec6104d21ab9a16d4221b98725faea09e6a2b7d99ed48a782becab6dd9de8d4f'
        '615b46441725af4887dc776b1bad0d8760e4b5fbcb686d7a62bdfe0b8c65384b36ecdf098cdcf1e911c9b55da285f15cc8b106e2e2cc0f70e48e42336e8fa278'
        '2c0240d6ccced663dc4f344efe1efcafea1931d18d7f10234a203f676aac319c4cefc49d2b693e4bbadebcb8583f5f536b3859a8b6c12afd54d8c0267ddda3e2'
        '0e564646864af79b8bfe148c05072c4777d3cced951af4f53334d16d889b1859ac25b4d4887b9a23bb941632bfa6e328e9d64bab205f37109a5057c96256284d'
        '7aabbe661ddfb348857bf89239c4b021cc5d9d1782ce4b4bc356a8e8bde6d6229ff4580f278c64666dd9d1904577053037a488296b862b1b86748a9d1a2dedad'
        'ff5fd723a757b0af1ab214864c8d79ab78e8c01dea500135519fa79f5a9dab6e46999129a58d21763ed0014bcdc44df46c1d13ccd0ca7c10094b95fc6f7a9a9d'
        '34ef58f131b83f66a233a590d70f4c0883a6be23ef42b754865371437326e36ae624d6d42a8ba5ab84c8facba07b0ebd2cf72fa410db1bd335dc79c7a9e78dc3'
        'fc8d42d08a20c2fdf6470d536a1d3d6f5b61b39b0cafedc3371a05b2ca4fff290b8821dbfbc748afe34db28c2217a771cde1eb7f77752d983d7e724fa0b44103'
        '406601f618e445463e971d5d13773d38faaaef98343daf75faf649371d1d1f40c53b2640bef3c04a49e668c44713e422f05ac88d3d4da305b5faf9fe3ca6f8d2'
        'eb32c99e682c40305cfb4caa0cf27bd79c26940623c5572c8166f15587ad709740e42909f3ecff35a4d0d896fe8266795b3f2caa96de0dacbbb3457d4131aea0'
        '0d68c90afc3a985724f6d5c97433ef7c83b906798c1400ced506a9d1aced98f24d6364fb7744222d136ba6604b8008530112834401c7139644a2bebb15f743cd'
        '37d2ec2e677e7c383d2ecf819a131992f941d8699f129b195cb2d13639b6f8c46db8e5a67c32bd23c2baad5f2553bf5540b1fc3f868e3d9a7ca8c548c1d92203'
        '08c68494ac4033fe0dc1e75d81bde4d8253c81d7c2c449de99d045caeed7ea6c054acd0c444770c1c021289656013f84eeaa32aeeaaa951068b8ee516cff13c5'
        '312e900bce7184a598688b7e82e8d1a49210f5e66fd8b1aa20a9f1d51fc653e496701c9c6cb77ee4aee8e9945084de335bd97c6b53fe7435fc01d1f28e0993ea'
        '10cc450ee7d790f1e0883e13d09bdc232eff9b848f3893e80526ea769170784da1880f9d48f1590a70f73b04d9399994b5e45b5df8fb2f7dae7ef65e7f96e62e'
        'f3a4eefc10cc62d402f21bee190966f9cb9a0b8c8334524043bc843c3ec8e86a39b751a8032a29edd050851a76ad823d8b40c8870ec71211a1f9ae84f7eff32b'
        '7ddd26f85b28792cedaecb7cf9f5b795d8edbe87a519f1693f32245981f2a642977e1ee338e027ca108af38c47d05a0d352d2b3ba93a187bd51593f03b10d113'
        '4877a04fbf30ef16d622af5a97c57e6600d0fe6a98f22669e862499feeeb118d2611082fd168d07c7dd62621e788f1e41e47fdca9d9116b667c762352566d53f')

package() {
  cd "${srcdir}"

  install -Dm644 ${_name}-snapshot-${_commit_id}.jar "${pkgdir}"/usr/share/java/${_name}/${_name}.jar

#.desktop and icon file
  install -Dm644 ${_app_id}.desktop \
        "${pkgdir}"/usr/share/applications/${_app_id}.desktop
  install -Dm644 ${_name}.1 \
        "${pkgdir}"/usr/share/man/man1/${_name}.1
  install -Dm644 ${_app_id}.appdata.xml \
        "${pkgdir}"/usr/share/metainfo/${_app_id}.appdata.xml
  install -Dm644 ${_app_id}.svg \
        "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg

  for _icon in 8 16 22 24 32 36 40 42 48 64 72 80 96 128 192 256 512; do
      install -Dm644 ${_icon}x${_icon}_${_app_id}.png \
        "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_app_id}.png
  done

#executable file
  install -d "${pkgdir}"/usr/bin
  cat <<"EOF" >"${pkgdir}"/usr/bin/${_name}
#!/bin/sh
# source application-specific settings
while true; do
    JOSM_ARGS=
    [ -f /etc/conf.d/josm ] && . /etc/conf.d/josm
    CLASSPATH="/usr/share/java/josm/josm.jar"
    java ${JOSM_ARGS} -cp "${CLASSPATH}" -Djosm.restart=true org.openstreetmap.josm.gui.MainApplication "$@"
    [ $? -eq 9 ] || break
done
EOF
  chmod 755 "${pkgdir}"/usr/bin/${_name}
  install -Dm644 "${srcdir}"/${_name}.conf.d "${pkgdir}"/etc/conf.d/${_name}
}
