pkgname=nsight-graphics
pkgver=2020.1.0
_pkgver=${pkgver//\./_}
pkgrel=1
pkgdesc="Standalone application for the debugging and profiling of graphics applications"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-graphics"
license=("custom")
#makedepends=("cmake")
#depends=("libx11" "libxcb" "mesa" "libgl" "qt5-base" "qt5-svg" "qt5-x11extras" "xcb-util-keysyms")
depends=("libx11" "libxcb" "nvidia" "openssl" "icu" "qt5-base" "qt5-multimedia" "qt5-location" "qt5-declarative" "qt5-script" "qt5-sensors" "qt5-svg" "qt5-webchannel" "qt5-webengine" "qt5-xmlpatterns" "qt5-tools" "qt5-charts")
source=("NVIDIA_Nsight_Graphics_${pkgver}.run::https://developer.nvidia.com/rdp/assets/nsight-graphics-${_pkgver}-linux-installer"
        "${pkgname}.png::http://developer.download.nvidia.com/NsightVisualStudio/3.1/Documentation/UserGuide/HTML/Content/Images/NSight_256.png"
        "${pkgname}.desktop")
sha512sums=("afb1779f46f04928e923705f21b42bf04ee49a6db9998e5844f801afdf9de1523aa2f04c47e0a03877327d8f938d0957a6a769ee0815ec5dca336712efb8d53d"
            "784985c2bd3a053cee4887af3b960c7fdc041dda3ca71196ec0870d5413f646d542687b16bffe85985a46d70f68ccf7df29ed5e39952d5e553a4beec485a1185"
            "f1bf5ebab9b766cba14438b0560652debe9b16f9a37bb1d606238d055cfc64f60978b6f2d64a30aced5e48ed4609bb535eb89d6606c49b927678b01c52d13546")
replaces=('nsight')
provides=('nsight')
options=('!debug')

prepare() {
  sh "NVIDIA_Nsight_Graphics_${pkgver}.run" --noexec --target ${pkgname}
  # Clearing the registering of VK_LAYER_NV_nomad, do it manually in package
  echo "" > ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/VK_LAYER_NV_nomad.sh

  # Remove libs in favor of system from depends
  # openssl
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libcrypto.so.1.0.0
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libssl.so.1.0.0
  # icu
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libicudata.so.56
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libicui18n.so.56
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libicuuc.so.56
  # qt5-base
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Concurrent.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Core.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5DBus.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Gui.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Network.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5OpenGL.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5PrintSupport.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Sql.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Test.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Widgets.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5XcbQpa.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Xml.so.5
  #rm -rf ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/Plugins/imageformats
  #rm -rf ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/Plugins/platforms
  # qt5-multimedia
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5MultimediaQuick.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Multimedia.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5MultimediaWidgets.so.5
  # qt5-location
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Positioning.so.5
  # qt5-declarative
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Qml.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5QuickParticles.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Quick.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5QuickTest.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5QuickWidgets.so.5
  # qt5-script
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Script.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5ScriptTools.so.5
  # qt5-sensors
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Sensors.so.5
  # qt5-svg
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Svg.so.5
  # qt5-webchannel
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5WebChannel.so.5
  # qt5-webengine
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5WebEngine.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5WebEngineCore.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5WebEngineWidgets.so.5
  # qt5-xmlpatterns
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5XmlPatterns.so.5
  # qt5-tools
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Help.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5DesignerComponents.so.5
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Designer.so.5
  # qt5-charts
  #rm ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/libQt5Charts.so.5
}

package() {
  cd ${srcdir}/${pkgname}
  ./install-linux.pl -noprompt -targetpath=${pkgdir}/opt/${pkgname}

  install -dm 755 "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/host/linux-desktop-nomad-x64/nv-nsight-gfx "${pkgdir}"/usr/bin

  install -Dt "${pkgdir}/usr/share/vulkan/implicit_layer.d" -m644 "${srcdir}/${pkgname}/pkg/target/linux-desktop-nomad-x64/VK_LAYER_NV_nomad_release_public_${_pkgver}.json"

  install -Dm644 "${srcdir}/${pkgname}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}/${pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname}/pkg/EULA.txt"
}

# vim:set ts=2 sw=2 et:
