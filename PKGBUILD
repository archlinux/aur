# Maintainer: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.4.0
pkgrel=5
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby'
         'xmlrpc-c'
         'openssl'
         'sqlite3'
         'openssh'
         'libxml2'
         'curl'
         'libxslt'
         'expat'
         'nfs-utils'
         'cdrkit'
         'log4cpp'
         'python2' #needed for novnc
         'mariadb'
         'libmariadbclient')
makedepends=('xmlrpc-c'
             'pkgconfig'
             'scons'
             'mariadb'
             'libmariadbclient')
optdepends=('nfs-utils: for using the shared file system storage model'
            'ruby-sequel: required when upgrading the database'
            'ruby-sqlite3: required when upgrading the database')
conflicts=('opennebula-unstable')
install=opennebula.install
backup=('etc/one/oned.conf'
        'etc/one/sunstone-server.conf'
        'etc/one/cli/onedatastore.yaml'
        'etc/one/cli/oneshowback.yaml'
        'etc/one/cli/onevdc.yaml'
        'etc/one/cli/onemarket.yaml'
        'etc/one/cli/onetemplate.yaml'
        'etc/one/cli/onevm.yaml'
        'etc/one/cli/oneacct.yaml'
        'etc/one/cli/oneuser.yaml'
        'etc/one/cli/onevrouter.yaml'
        'etc/one/cli/oneimage.yaml'
        'etc/one/cli/onemarketapp.yaml'
        'etc/one/cli/onehost.yaml'
        'etc/one/cli/onevnet.yaml'
        'etc/one/cli/onecluster.yaml'
        'etc/one/cli/onezone.yaml'
        'etc/one/cli/onesecgroup.yaml'
        'etc/one/cli/onegroup.yaml'
        'etc/one/cli/oneacl.yaml'
        'etc/one/ec2_driver.conf'
        'etc/one/econe.conf'
        'etc/one/az_driver.conf'
        'etc/one/onegate-server.conf'
        'etc/one/oneflow-server.conf'
        'etc/one/az_driver.default'
        'etc/one/tmrc'
        'etc/one/vmm_exec/vmm_execrc'
        'etc/one/vmm_exec/vmm_exec_vcenter.conf'
        'etc/one/vmm_exec/vmm_exec_kvm.conf'
        'etc/one/oned.conf'
        'etc/one/auth/ldap_auth.conf'
        'etc/one/auth/x509_auth.conf'
        'etc/one/auth/server_x509_auth.conf'
        'etc/one/ec2query_templates/m1.small.erb'
        'etc/one/defaultrc'
        'etc/one/sunstone-views.yaml'
        'etc/one/hm/hmrc'
        'etc/one/sunstone-logos.yaml'
        'etc/one/sunstone-views/admin.yaml'
        'etc/one/sunstone-views/groupadmin_vcenter.yaml'
        'etc/one/sunstone-views/cloud_vcenter.yaml'
        'etc/one/sunstone-views/admin_vcenter.yaml'
        'etc/one/sunstone-views/cloud.yaml'
        'etc/one/sunstone-views/groupadmin.yaml'
        'etc/one/sunstone-views/user.yaml'
        'etc/one/sched.conf'
        'etc/one/ec2_driver.default')
changelog=ChangeLog
source=("http://downloads.opennebula.org/packages/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'opennebula.service'
        'opennebula-scheduler.service'
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'opennebula-onegate.service'
        'opennebula-novnc.service'
        'opennebula.conf'
        'opennebula.logrotate'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch'
        'vip.sh.patch'
        'opennebula.install')
sha512sums=('4d7d4f6c20a6185539a88006e4d15681d90cee45506d36017a538415a3b3cce809f02ff248013f9e2daa5f1d20afd308a0a014853b8462723ad6ba5acaa84626' #package
            '3d63703f869313ddccc8595ceaca2c65bcfab5ea771df3471909b8421587c1c596227094dbc99fe91181cc0dacf2fdc1a772f88124ee5eb6fa141123998c21ea' #opennebula.service
            'a563f1c6458d16c6b13f92aaf0b515127a2c30f25cd398eba0571d511fd38dfcfc0a3374d2df242dbd1963f6a0fd85fa95ee8ac1766f8d39717d7998479d9db9' #opennebula-scheduler.service
            'e5129f9464edc3719d035b81429d1f12af6519b33be7842aa07583f26ac26dcf02545128d68a077c673c7e37debddf5e28edc1cb8d80f9a8a3e9c85f39c80710' #opennebula-sunstone.service
            'a78cefc6a28674c8c65d22d8de242130ae46c1aafc82292fe470cd4890dbb5f08b4d74dc72c1961782e96bc415f5d439db2d05d272b43ee84ebdb75cd7026f7b' #opennebula-econe.service
            '44b1697d73e6b67cbad5c581f19fa57d730aedd87c4513080628845296d21454f208c746205bef35564dbbb8ca52935441d01bed790d4f3a63ae474e0b9f253d' #opennebula-oneflow.service
            '17ce8a26f187af95420b28fa3fd2db173fd98997080b3de99dc6d077e03054b9d98eff670728dcad34f54b9d27abe69ac4c7cdab2ebab02e9da159921bb1d2b8' #opennebula-onegate.service
            '645765b6752d5a021412e633b950959201d0be92e4845894dba2a3137e1dae57d62f41b55ebbd098a065528ba836b07c3ebf1a7a6f7cbfa49b2a3da12ead6012' #opennebula-novnc.service
            '620581599f1b0c4c6d4fdb87a6b41c937b8ef79401a6a047f8556517c726a5c61f9fc241a3d82a836b5728de3aa36a11d45cbfb1beb111e35c75485cb7b97228' #opennebula.conf
            '59ccef79f578997b5a1ef5bf53bc36beb233f935b13da466b887254272036b876946e1b74ed3692f4dc8bc2cc3855a61f06d047e179d8aefe73afbfeb886b655' #opennebula.logrotate
            '01aaf2d6019003ab69cd2e9886618d59bed27062f68fe72f29662f70af9206ce3921053c4cab30c370da958be243a6b19e85094af40ff93b6e370505ddd8bbe2' #chown_fix.patch
            'cee672a3fb9bffdac836a9aa00c898a38303144be44521363ad8e5109aebaa00e31fc0ae921e3a71a87e734fc614f6b3350009d5ec899bc5d78e6fe6d6c8fc01' #set_locations.patch
            '18b1964cb4e3fc2eaa93a7ef79e4b9b185584d33ad4f7fa33cd33a74516334136d9cf0ee25921c189250420b751c753cb0142227e8de39e14f8d110e97cd8e30' #fix_kvm_emulator.patch
            '5b13cd565d2c73e5a5582dc2efcef58e84ee206b96519c2a371a09b52305620b062ca81daf35ed582e182afcc421b668a8ee3fc999a295fa8973d11482c5083b' #vip.sh.patch
            '235d47ab6b7342db65b73533fab8084484cb95914604ffc68a419a13b41540b5e7983f46808f9b9cfc90bfeb69dfb1dfd8be61167791246e1631e93296a6ac7e' #opennebula.install
            )

prepare() {
  cd "${pkgname}-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p0 < "${srcdir}/fix_kvm_emulator.patch"
  # Patch for https://dev.opennebula.org/issues/5309
  patch -p0 < "${srcdir}/vip.sh.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  ###########################################################################
  ##                                                                       ##
  ## It is highly recommended that you read the documentation and tweak    ##
  ## the PKGBUILD accordingly:                                             ##
  ## http://docs.opennebula.org/stable/integration/references/compile.html ##
  ##                                                                       ##
  ###########################################################################

  # This builds the vanilla OpenNebula package. Tweak this line as desired.
  scons -j "$(nproc)" new_xmlrpc=yes mysql=yes sqlite=yes
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"
  install -D -m644 "${srcdir}/opennebula-scheduler.service" "${pkgdir}/usr/lib/systemd/system/opennebula-scheduler.service"
  install -D -m644 "${srcdir}/opennebula-novnc.service" "${pkgdir}/usr/lib/systemd/system/opennebula-novnc.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"
  install -D -m644 "${srcdir}/opennebula-onegate.service" "${pkgdir}/usr/lib/systemd/system/opennebula-onegate.service"
  install -D -m644 "${srcdir}/opennebula.conf" "${pkgdir}/etc/tmpfiles.d/opennebula.conf"
  install -D -m644 "${srcdir}/opennebula.logrotate" "${pkgdir}/etc/logrotate.d/opennebula"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}

