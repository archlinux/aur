pkgname=watchit
pkgver=0.1.0
pkgrel=2
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
    cp -r "${srcdir}/opt/watchit/" "${pkgdir}/opt/${pkgname}/"
    

    #install -Dm644 "${pkgdir}/opt/${pkgname}/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
    
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 ${srcdir}/usr/share/icons/hicolor/0x0/apps/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  
    #chmod 4755 '/opt/watchit/chrome-sandbox' || true
    install -d "${pkgdir}/usr/bin/"
    ln -sf /opt/watchit/watchit "${pkgdir}/usr/bin/watchit"
}
md5sums=('3f89524b65adc1325c445e60f32933b6'
         'a6cdf9cea47aee33b2525d57b577b877')
sha512sums=('d865bce58705c2a918c395fd57254a6976634458860616ef3d6d16be8ed93661db3d73166fd8f89f2e0d47e814a64c49229fd3313cb78c79b0e9706edf5967f6'
            '1ea919859b801d8cb12e0db9ec3926851e83dbddeea6e571572ce1e85d008a3d65889a784ffed58bbef77d5c499d6e71d740b221c9c7a6a8e8f02bf367d4ee78')
b2sums=('e19128e10b23110be0aee9342639d624f45f4c04ab0564e85713edd6c04db1d6b5079b17ab2b296d38c71f4198ae111cd7fe507ed777d7d46029517a1c77c982'
        '733755913c0c9ba6d2c912f8efa5ccb1278d1faa433813cc6a0e4b79844e3ec8d28556151595277649e8dde08b5ce99ab56e5cc122e8485062ee965809165423')
