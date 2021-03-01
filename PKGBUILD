pkgname=watchit
pkgver=0.1.0
pkgrel=1
pkgdesc='Watch movies everywhere'
arch=('x86_64')
url='http://watchitapp.site/'
#depends=(libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libatspi2.0-0, libuuid1, libappindicator3-1, libsecret-1-0)
depends=("electron")
license=('custom:ZorrillosDev')
_file="watchit_0.1.0-beta.2_amd64.deb"
source=("${_file}::https://github.com/ZorrillosDev/watchit-desktop/releases/download/v0.1.0-beta.2/${_file}"
"${pkgname}.desktop")

build() {

  ar -x ${_file}
  tar xf ${srcdir}/data.tar.xz

}

package() {
    install -d "${pkgdir}/opt/"
    cp -r "${srcdir}/opt/watchit/resources/" "${pkgdir}/opt/${pkgname}/"
    #install -Dm644 "${pkgdir}/opt/${pkgname}/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
    
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/0x0/apps/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

md5sums=('3f89524b65adc1325c445e60f32933b6'
         '8b050e57240cf20f92fd0a6efbf7746b')
sha512sums=('d865bce58705c2a918c395fd57254a6976634458860616ef3d6d16be8ed93661db3d73166fd8f89f2e0d47e814a64c49229fd3313cb78c79b0e9706edf5967f6'
            '8a98364faa885967f792dd26f9af08494743b91d16063470af3c1f78ce4d1d1fc41bc09d2cb5fc3504f33fde1c4e2f5244ec2ee3a652f13c39b5f62d68c488cd')
b2sums=('e19128e10b23110be0aee9342639d624f45f4c04ab0564e85713edd6c04db1d6b5079b17ab2b296d38c71f4198ae111cd7fe507ed777d7d46029517a1c77c982'
        'ef8f65429c4a499a47c4cb6c7b24aae3925d4f52a4b9367ed0188e18c4816c04c2b422d6988795498c2525bf6221c7034d2751d8433f6e31e86d7b6d388056c6')
