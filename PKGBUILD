# Maintainer: Michael Roth <mail.michael.roth+aur@gmail.com>
pkgname=megaman-rocknroll
pkgver=1.2
pkgrel=3

pkgdesc="MegaMan based fan game made with Godot"
url="https://dennisengelhard.com/rock-n-roll/"
license=('unknown')

arch=('x86_64')

install=megaman-rocknroll.install

#Original dependencies found by ldd
#depends=('alsa-lib' 'dbus' 'flac' 'gcc-libs' 'glibc' 'libasyncns' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libogg' 'libpulse' 'libsndfile' 'libvorbis' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxrender' 'lz4' 'systemd-libs' 'xz')

depends=('alsa-lib' 'dbus' 'flac' 'gcc-libs' 'glibc' 'libasyncns' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libogg' 'libpulse' 'libsndfile' 'libvorbis' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxrender' 'lz4' 'systemd-libs' 'xz')

source=("https://dennisengelhard.files.wordpress.com/2020/02/megaman_rocknroll_linux1.2.zip"
         megaman-rocknroll.desktop
         mmrnr.png
)

sha256sums=('f916bdf0dec0983274609b36fce2c04eb49c91dbf57255884bbcb07938516464'
            '8fe73015af3b6f684f278b0f6aa274f82ca78f80264f2e3af2cc96145075fb0a'
            '93d862cacc440d79434450e345cfcdf7e84791bd550ea0ccb234acd9a0d62613')



package() {
  # Install Game executable and data files
  install -D -m 755 "${srcdir}/MegaMan_RocknRoll" "${pkgdir}/opt/megaman-rocknroll/MegaMan_RocknRoll"
  install -D -m 644 "${srcdir}/data.pck" "${pkgdir}/opt/megaman-rocknroll/data.pck"
  
  # Install icon
  install -D -m 644 "${srcdir}/mmrnr.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mmrnr.png"
  
  # Install .desktop file
  install -D -m 644 "${srcdir}/megaman-rocknroll.desktop" "${pkgdir}/usr/share/applications/megaman-rocknroll.desktop"
}
