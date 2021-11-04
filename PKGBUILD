# Maintainer: Michael Roth <mail.michael.roth+aur@gmail.com>
pkgname=megaman-rocknroll
pkgver=1.3
pkgrel=1

pkgdesc="Mega Man fangame made with Godot"
url="https://dennisengelhard.com/rock-n-roll/"
license=('unknown')

arch=('x86_64')

install=megaman-rocknroll.install

#Original dependencies found by ldd
#depends=('alsa-lib' 'dbus' 'flac' 'gcc-libs' 'glibc' 'libasyncns' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libogg' 'libpulse' 'libsndfile' 'libvorbis' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxrender' 'lz4' 'systemd-libs' 'xz')

depends=('alsa-lib' 'dbus' 'flac' 'gcc-libs' 'glibc' 'libasyncns' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libogg' 'libpulse' 'libsndfile' 'libvorbis' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxrender' 'lz4' 'systemd-libs' 'xz')

source=("https://dennisengelhard.files.wordpress.com/2021/01/megaman_rocknroll_linux_1.3.zip"
         megaman-rocknroll.desktop
         mmrnr.png
)

sha256sums=('af916d57c169ef9b964457f60638c553a6dd7e623cd4fca0c1d828c40919abd9'
            '39de3a403d1e0be869b7d4be7fe5a7988fb9b35912d49c386c2aa97931b7e3be'
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
