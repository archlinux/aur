# Contributor: grimi

pkgname=mime-archpkg
pkgver=0.3.9.3
pkgrel=1
pkgdesc="mime type for archlinux packages"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('shared-mime-info' 'gtk-update-icon-cache' 'librsvg')
install=${pkgname}.install
source=(${pkgname}.{xml,sh} {install,update,remove}.hook hook-script.sh
        {hicolor,gnome,Tango,oxygen,nuoveXT2,Faenza,Faience,NITRUX,Numix,breeze,FaenzaFlattr2-Zephyr,elementary,Paper,Papirus,Emerald}.svgz)
sha256sums=('b6754602d6d71e80b6966ce7927fa355b1639be89f882ad9934237ed0c99f7f1'
            'eb942ad2f00cf95229d59a71462b49fe98ad08eb59b0a826087608f222b8da3b'
            'fa24289460397891c692d4a13c27b76065075b27153685ce9adf2890f41936db'
            '6d2ee985ad7ae820d3b9d4d6016c56749ccbbe2aa2649f08794d5efeca32f05a'
            'd0c45afb226e1dd956972990c312ccffcda4f284c720d2463c0c09b06d23a509'
            'f374e455f0e4bfd5327d9a9ae32410f0698c916199ac46631d53b4d8f58cbcb7'
            '86dd413e049c84cd422f9fa64e48c0354b1d40b5db3057cc73c20b4efaed377a'
            '1068084050e82f914e71b6e15d90bb5b6a99ba9b1b4585bbe069ab2f93ebe4a2'
            'c13b464f6d0b71e7c455de1e280e8189286cd565d82294a4db2d1e8641457201'
            'c8c25594c5726705c68218c3ee21f483298b129bccb4f14aeab4fa9b7630d080'
            'fe2edcdc32e4aa914f76921037a9b883a303aba7b0db97a225d2a0838273b751'
            '1e0f7848e49184b23a2089bc09226ec04d9ae5655a289b0413fa5bf15bbeb04d'
            'c191aeae5971dba6c025872929edc0409940897a126ca3053205ce186a5fcc2c'
            '783f8fb9c9e107a0e9c9a1e88ef6d611fc79d2e1f2ee83077dc2e862a23f0456'
            '849022b77e70527c36efc0e02a1326581814af00c2a84997a1af0a9f623ba970'
            '44c2d8246890da621e17541560601a5db5425d41e4c3f0c9cb807e13833d8040'
            '47561c547893ea4630ecabb84d14a0fd8e7c3e6d8e0cd4bd5e041c47bca9e739'
            '191cfd7ee153d88fb0525bb60e40c2d02b3bd720f325f6bc3c27f2d0f8fbd9fb'
            'cf123397456c7d2bc018f07797cd397701c9fd5c3dddc474b851ce442e260f4f'
            '06d80d0f7310b75f96d6b226e44e85e893175110c6fbf2908e9995a70a131d6b'
            'd5a539ebed85da9a2c1d14e8ba6a90d0c8f5a61d87900f571547d3c0c6ccddf7')



package() {
  install -Dm644 ${pkgname}.xml "${pkgdir}"/usr/share/mime/packages/archpkg.xml
  install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
  install -d "${pkgdir}"/usr/share/${pkgname}
  install -m644 *.svgz "${pkgdir}"/usr/share/${pkgname}/
  install -Dm755 hook-script.sh "${pkgdir}"/usr/share/libalpm/scripts/${pkgname}
  install -Dm644 install.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-install.hook
  install -m644 update.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-update.hook
  install -m644 remove.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-remove.hook
  # links
  cd "${pkgdir}"/usr/share/${pkgname}
  ln -sf elementary.svgz elementary-xfce.svgz
  ln -sf Papirus.svgz Papirus-Adapta.svgz
  ln -sf Papirus.svgz Papirus-Adapta-Nokto.svgz
  ln -sf Papirus.svgz Papirus-Dark.svgz
  ln -sf Papirus.svgz Papirus-Light.svgz
  ln -sf Papirus.svgz ePapirus.svgz
}


# vim: set et sts=2 sw=2 ts=2 :

