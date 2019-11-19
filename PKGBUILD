# Maintainer: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.4.1
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
# nodejs-lts-dubnium due to bug with nodehun build fail
depends=('nodejs-lts-dubnium' 'noto-fonts')
# noto-fonts required due to bug https://github.com/ONLYOFFICE/DocumentServer/issues/377#issuecomment-455782913
makedepends=('npm' 'nodejs-lts-dubnium' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'python2' 'java-runtime' 'svn' 'ncurses5-compat-libs')
# ncurses-5compat-libs required to build v8
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-5.4.1.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/c8def9eb7bc02d675d0f1c64d2acf5b9cdf2bca8.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/abc25e4538cbce3ba96671283d14cec09087829b.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/0e43b7b8aeb099ec30725f39234e2b898e7f0e67.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/00800885c8c07d908dfb7e093cc045fbedc275b3.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/03b41c0dff8b50aedc2fb914d3c8b7d051d45228.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/09f7fee6a0cafb8c95eeee6d6d525134e7cccd20.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps-pro/archive/9f0f3e7396488e9bbbac1704432e73147cec1fe5.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles")
sha512sums=('5e5b2ac052d1e39a415cd6e7a8004095c2eb4c4098717a6dfc96e6f5c6cd31d124870d1b08e722f1b0c903e92f95cd482d99ac13ab4fa4a2d89eaddec3cc8eb5'
            '7afd1cc73fd721ccf649994a296fd833da334d70bbd7ce71ec34ff27503339e25514619b856cf8364d984a49b8058e05150d612207bc8e28c61cfeea00551411'
            '0a3a2daa0c3c8a3b63ae2e02b4afc2324c0b7cab70b87d18068790cd664d35a7b11083db2e56f62aa2508f942570092aa91ab78097755ab6d8ca3b1459767030'
            '9f59b29a946b421aed5ff81d8a1bf1e6f33ab95387a052dd53aa2b03313c44aac9a441e4bc5ef2caa2401d4eba24e843cf2dd90c90118ff96d89d540e36eef47'
            'b3357e34ac8ace549d5cb89889b288dd855e32c469f9b9d5a6851c944d5c9ed975a1ee1f8980ad1d932ab5b6f947cb7cfe85eb00d19b07fc1eb5bbcb479171b2'
            '446685c33125fe93d09137f149552a591c6e58148d17eace28f290248992a212179317b4b087a8448b0ec73e047819f246ab703e1534b9c9c30024b42b9ee034'
            'd564c3d99cfb8d746818fab0e9b824dae5a0fd6713067119971bade418996c7181950e39111b87191fa93111f1810cfe10c109dadde87edb4a1ba7d404aa0f51'
            '454e6ce01f748966bb3729693fcd687163bf3776bb912908156f2439e56649ac226f7f76577ddf5f9159f2ce63a8d45fdcaae8c7f1e880a95e5153a6d02314d7'
            '40c9ecaa2b2008c152cfb89988bb175b3824550ca913b14365226be9b003c7c394d1c70d269ab64edb7d0eda483d4c67aac232f4ac404d73f5c807483e235f28'
            'f6e888d23d980eb50dcd70c1ce82324f3ee60c666298f77adf7f7abdf524d78bfcd10a8e17180a64596d964d98ae5457645ece6e3d05d93b938f465f2dc3612a'
            '8ed8c1301469242cc669a1f0520708ad0fa4f19406541c976cd9287917f573ec3f47902f9021eef5ff82ca20de04234f459e4826320689705772589b1aca0267'
            'fafee1aa872786116d5c28c08dbe12edcf0dd60890c40b108bb60c9d321d9a579fc8fe6a8a86c1641b58531388410fb51e09d294b9b998ca9a39373349e889a0'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"

prepare() {
  # Unfortunately, v8 depot_tools still requires python2
  # Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd "${srcdir}"
  rm *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  rm -r core core-fonts dictionaries sdkjs sdkjs-plugins server web-apps-pro
  mv ../core-fonts* core-fonts
  mv ../core-* core
  mv ../dictionaries-* dictionaries
  mv ../sdkjs-plugins-* sdkjs-plugins
  mv ../sdkjs-* sdkjs
  mv ../server-* server
  mv ../web-apps-* web-apps-pro

  # Use clang instead of gcc because of compile errors
  sed -i 's/is_clang=false/is_clang=true/g' core/Common/3dParty/v8/build.sh

  # python2 dependency for gclient
  sed -i '12iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/fetch.sh
  sed -i '28iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/build.sh

  # drop back to v8 6.0, not 7.0 - fixes build issues
  sed -i 's/v8_version="7.0"/v8_version="6.0"/g' core/Common/3dParty/v8/fetch.sh

  # Patching Makefile to include DESTDIR variable
  patch -p0 -i ../server_makefile.patch

  # Patching configuration file
  sed -i 's/\/var\/www\/onlyoffice/\/usr\/share\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
  sed -i 's/\/etc\/onlyoffice/\/etc\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
}

build() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"

  # workaround bug https://github.com/ONLYOFFICE/onlyoffice-owncloud/issues/42
  export PRODUCT_VERSION=${pkgver}

  # Download & build third party modules 
  cd core/Common/3dParty
  ./make.sh

  # Building core
  cd ../..
  make

  # Building sdkjs
  cd ../sdkjs
  make

  # Building server
  cd ../server
  make 
}

package() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}/server"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
  make DOCUMENT_ROOT="/usr/share/webapps/onlyoffice/documentserver" DESTDIR=${pkgdir} install
}
