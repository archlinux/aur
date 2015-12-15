# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgbase=amarok
pkgname=${pkgbase}-light
pkgver=2.8.0
pkgrel=1
pkgdesc="The powerful music player for KDE stripped of integrated web services, applets, default scripts, extra languages, and iPod and media devices support."
arch=("i686" "x86_64")
url="http://amarok.kde.org/"
license=('GPL2' 'LGPL2.1' 'FDL')
depends=('kdebase-runtime' 'mariadb' 'qtscriptgenerator' 'taglib-extras' 'ffmpeg')
makedepends=('pkgconfig' 'automoc4' 'cmake') # Add 'libgpod', 'libmtp', 'loudmouth', 'libmygpo-qt', and/or 'clamz' if you require them.
# Add the optdepend you need
#optdepends=("libgpod: support for Apple iPod audio devices"
#            "libmtp: support for portable media devices"
#            "loudmouth: backend for Mp3tunes.com integration"
#            "openssl: Mp3tunes.com integration"
#            "ifuse: support for Apple iPod Touch and iPhone"
#            "libmygpo-qt: gpodder.net Internet Service"
#            "liblastfm: LastFM Internet Service"
#            "libofa: Open Fingerprint Architecture library for Musicbrainz and AmpliFIND"
#            "qjson: JSON parser for the Playdar Collection"
#            "clamz: support for downloading songs from Amazon.com"
#            "phonon-gstreamer: alternative backend supports Equalizer and Audio Analyzer Visualization Applet"
#            "kdemultimedia-audiocd-kio: Compact Disc(CD) support")
conflicts=(${pkgbase})
provides=(${pkgbase})
install="${pkgbase}.install"
source=("http://download.kde.org/stable/${pkgbase}/${pkgver}/src/${pkgbase}-${pkgver}.tar.bz2")
sha256sums=('f4b89b28f217a6d947e55fb0890de22fad8c404794c6beeb2dcaf2711b4f8ec6')

prepare() {

  # applets
  sed -i '/albums/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/analyzer/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/currenttrack/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/info/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/labels/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/lyrics/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/photos/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/similarartists/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/tabs/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/upcomingevents/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt
  sed -i '/wikipedia/d' ${pkgbase}-${pkgver}/src/context/applets/CMakeLists.txt

  # engines
  sed -i '/current/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/info/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/labels/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/lyrics/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/photos/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/similarartists/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/tabs/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/upcomingevents/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt
  sed -i '/wikipedia/d' ${pkgbase}-${pkgver}/src/context/engines/CMakeLists.txt

  # collections
  sed -i '/audiocd/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/daap/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/ipodcollection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/mtpcollection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/nepomukconnection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/playdarcollection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/umscollection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt
  sed -i '/upnpcollection/d' ${pkgbase}-${pkgver}/src/core-impl/collections/CMakeLists.txt

  # services
  sed -i '/amazon/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/ampache/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/gpodder/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/jamendo/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/lastfm/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/magnatune/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/mp3tunes/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt
  sed -i '/opmldirectory/d' ${pkgbase}-${pkgver}/src/services/CMakeLists.txt

  # scripts
  sed -i '/free_music_charts_service/d' ${pkgbase}-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/librivox_service/d' ${pkgbase}-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/lyrics_lyricwiki/d' ${pkgbase}-${pkgver}/src/scripts/CMakeLists.txt
  sed -i '/radio_station_service/d' ${pkgbase}-${pkgver}/src/scripts/CMakeLists.txt

  # utilities
  sed -i '/amzdownloader/d' ${pkgbase}-${pkgver}/utilities/CMakeLists.txt

  # languages
  sed -i '/(bs)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ca)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ca@valencia)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(cs)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(de)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(da)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(el)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(en_GB)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(es)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(et)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(eu)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(fr)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(fi)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ga)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(gl)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(hu)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(it)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ja)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(lt)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(lv)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(nb)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(nl)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(pa)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(pl)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(pt)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(pt_BR)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ro)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(ru)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sl)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr@ijekavian)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr@ijekavianlatin)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sr@latin)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(sv)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(tr)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(uk)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(zh_CN)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt
  sed -i '/(zh_TW)/d' ${pkgbase}-${pkgver}/po/CMakeLists.txt

  # documentation languages
  sed -i '/(de)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(en_US)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(es)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(et)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(nl)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(pt)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(pt_BR)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(ru)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(sv)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt
  sed -i '/(uk)/d' ${pkgbase}-${pkgver}/doc/CMakeLists.txt

  if [[ -d build ]]
  then
    rm -rf build
  fi
  mkdir build

}

build() {

  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LibLastFm=OFF \
    -DWITH_MP3Tunes=OFF \
    -DWITH_Mtp=OFF \
    -DWITH_IPOD=OFF \
    -DWITH_LibOFA=OFF \
    -DWITH_QJSON=OFF \
    -DWITH_Mygpo-qt=OFF \
    -DWITH_NepomukCore=OFF \
    -DWITH_Soprano=OFF \
    -DWITH_PLAYGROUND=OFF
  make

}

package(){

  cd build
  make DESTDIR="${pkgdir}" install

}

