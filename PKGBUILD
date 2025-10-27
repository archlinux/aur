# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.3
pkgrel=3
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
_ceph_libs_packages=(
  ceph_{common,compressor,crypto,erasure}
  lib{rados,cephfs,rbd,rgw,cephsqlite}
  python_{ceph_common,rados,rbd,cephfs,rgw}
)
_ceph_packages=(
  ceph_{tools,test,volume}
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw,node_proxy}
  cephfs_{top,shell}
)
source=(
  $(
    printf '%s\n' "${_ceph_libs_packages[@]}" "${_ceph_packages[@]}" \
    | xargs -I@ printf '%s::%s ' \
      "@_${pkgver}_${pkgrel}.tar.zst" \
      "https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/@_linux_${arch}.tar.zstd" \
  )
)
sha512sums=('50271508eef1080ec24ac41964507676226b23647429d842b7daafa5a3c186481bc63b182b754283286667d69475f72c33e159a6525afbf576900717856a414a'
            '0b5505e674b4d1b4eb18f3541f320c347d51cd6abd7228a373c0633b56ef9f5ed0388171ad86115b47cba96bd91de2784a8ce2d798c3c1e9f4fa9fc6019b07c7'
            '569fcec90ab5e8b96afbe582317bce44e53336209bd625f9cc4b4b546c02a4be8682dd757cc3dca867030cc24f86b01a24727e2de6cbd2e59944b6e13e94e6a4'
            'd9f9b4caed3f5d05ed7dc002fc69f2b968f4af6ce9deabb65a557dea03e825fc34f62bd55ad804d8a9efa54e273fe57a23988b661601a1ce4b9ed9c80cd22b6d'
            '9b6a46170d68d67cd857240892c117b824bd73a278e51a6e49726cc9d59ec6df36f9948427ce953d4fda23965e63b841ed3062bde2dc857e24a61471b8786f05'
            '6ec7723ebc6a16bbe7829408a28282e24a296ac409fba5b1df0651a43a77e92dc34699fe9c38d408203764654a917c000e54b50772eb4356c5ec785b8bfb76ca'
            'd26731f33f2bd7d83d810b5823301369e9803cdd8774f95fc86f5496e1fbe5f2d1ae3bb992314565cdf5c38e435f539bad112542a4a4e165be2454480ea9fcff'
            '04cf4dafcf7a11686eaf94ddb560cdbc34644279b9242e805d9b02b03b13a3637ff1f64532ad4fd9bd78373c24a1108419578f7be15d4bf1cbcf24f77b05849d'
            '429fc0bda2e8d977907050abf135da4a8b556aa21457730ded6c1e25ded5f870ab02d3ca3b0948c8aa1aa758c9d61539271d4a981ad051821799140f4d756283'
            '93434805162061d28e6c7fef0f75a187e402dc567def967f126f9acd53ad35cae30c8f272d5bf826fecbd9e19be8fbdca70da913ff750b0a362798cb3c760bce'
            '2bf594e84260110db3c98a561e1300522350bdbdbf4133daede594e045b30d0fbea233a559051173936579266fdcd1905638204b6563e079d617d22e536fd8f0'
            'a762efccda8b574900e2d9554908968bc790086f7d8286b4f93d9ef164a15e6630c9b57e63aa4e862eb701ff5f3e0f209a5e5392afe2a51018dcfb44570a04d7'
            '1e6d2141d963ff6e32489afef1c41c1a2d5c2148ee2bf9ba8ab9b6012fe2feed10c1aac19e7a78fd6f630f87c6393d6aebc136551c6707760972cfffb8f4f0f3'
            '60fef2e3a5d70a0c4d366ab67380bbff1250652368c31c8f41ea8f015d3e932a86cd79e165125fda4d19b195cde390259c14aa034d14128ad56f64b134908f43'
            '82c3f48104796a11f4b13e58fa00d17c3dfe51b517116dd5506d27178c45f923f9937e8ba6c16c6f1e2a549e044f3e48a9be05e487034bd92962049f320a5e54'
            'd5fb3482b024f4e1df7bfe475bdc6382d495d13077b539ea96458514730a85f3f018e8a1dac0ae346a88dc066d65d80ca55ee502ebd7e9d5fd1c48183975627f'
            'c0c41e519eedada073325b8c7598ce50500a671c12ec3f6a9f1973933980d29be5ca3c76d83f473211ee06a15e51dfa4537087f0a20cdfa7cf1dad625b396f6a'
            'b246b01eb49a7d2618d2b4d3b8ca1fa658794ba42c3f7f7526aed682292b3720cf9fdaee936874675b3473811fdad32938fb444ea055b7d039d49fd3d9616a29'
            'fcc54bf178ed447493afedf3d6b7e0c18295325c3f662556d6c1167336c99ba0dee8c1120438f01d93baf54e377260ca06460d0097be0366d9bfdc608223ccfa'
            '9d4234f1e69a7db6060c08820c841b1c74930835f177e7e077ab7d249b84088772b6ca908b9f4fccadeac215e5b2b5c9673fdb80dacbdc2451cb964b22959ede'
            'e76a81b2ece1e12b64db7889bff45e119bdb7b1f975d6ca74091626809a2fb178b780d0368ce7cb84242d826f91d0ed61915cdd3ad035cecad962fde2c4a94d5'
            '2d5c814cd972a32e667fdfdc56a5cddf4ae1b6e427364546849362675d15eb7192140e934024e47d6ed9b78ff5e42c85ad28062817c3b1d60f94f4e090093a33'
            'e6394c37ac1fd17c18cd2808b52b8800eecd1a014c4c6191e8d12ba2860121edc6cb851f42b75a7ee9067c7dffb1562edf7077321266dea6fed8b09b729735a3'
            '22f507b819d1c1715000bcfdfc9d5de26e95b6ce1000b9542cf8f190164590dd9c2d8573fc2c57d9fc0c1487f43d9bc96cc143ccb2731c5611d35f2927d54303'
            'e12bdda37d8bff4fd603de61bbd10a94d44209f11b330c517ad2b30071cf6e0107a14e570622fd37dfbbe398d4cca8cd497bba54ce6d0c4da1261053d3c01dd8'
            '2574e0db661c8b44c9c08756175ed79087373ef5d0d9e75b2721e8f7ba0560f8572d08f4c97bcc1690e8bcaa2e4dcd5362423b0609651eece12def8063275fe2'
            'ed66ef3d46338947d54353726878798543bbf9e0eaee1f8cae991e05fd4d24371d7a622a893f1631ba6b10e7ed2e5aa25f548bb212593049e72fa5d8bde0d9e9'
            'd7c178a831dd83d48c00ba420b07185797b926fe42e202d536e7d1d4b5aab1a23d2d5b036ad2c9f2d5ae83c90b025f830cc56004bdc09235e7924778b96381ca'
            '54008485573440474d6fb70cbf5d65579115b989dd19cc1e132ca9819d17be2196276203657dd11a442e562aca6dd6327ee7913ce70905662fc59af324908db0')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua'           'lz4'                 'nss'                'oath-toolkit'
    'openssl'    'python'        'snappy'              'systemd-libs'       'zlib'
    'zstd'

    'python-prettytable'  'python-setuptools'  'python-yaml'
  )
  provides=('ceph-libs')
  conflicts=('ceph-libs')

  cd "${srcdir}"

  local p ; for p in "${_ceph_libs_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

package_ceph-bin() {
  depends=(
    "ceph-libs-bin=${pkgver}-${pkgrel}"

    'bash'         'boost-libs'   'cryptsetup'     'expat'          'fmt'
    'fuse3'        'gawk'         'gcc-libs'       'gperftools'     'libaio'
    'libcap'       'libcap-ng'    'libnbd'         'libnl'          'librabbitmq-c'
    'librdkafka'   'lua'          'lvm2'           'oath-toolkit'   'python'
    'snappy'       'sqlite'       'systemd-libs'

    'python-bcrypt'     'python-cheroot'     'python-cherrypy'            'python-cmd2'       'python-colorama'
    'python-coverage'   'python-dateutil'    'python-importlib-metadata'  'python-jinja'      'python-jsonpatch'
    'python-packaging'  'python-pecan'       'python-prettytable'         'python-pyopenssl'  'python-requests'
    'python-scipy'      'python-setuptools'  'python-typing_extensions'   'python-urllib3'    'python-werkzeug'
    'python-yaml'
  )
  optdepends=(
    'smartmontools: disk monitoring via S.M.A.R.T'
    'nvme-cli: disk monitoring for NVMe drives'
    'cephadm: Required if cluster is managed via cephadm'
    'python-kubernetes: For mgr/module:rook,k8sevents'
    'python-numpy: For mgr/module:diskprediction_local'
    'python-influxdb: For mgr/module:influx'
  )
  backup=(
    'etc/logrotate.d/ceph'
    'etc/udev/rules.d/50-ceph-rbd.rules'
    'etc/sysctl.d/90-ceph-osd.conf'
    'etc/sudoers.d/90-ceph'
  )
  conflicts=('ceph')

  cd "${srcdir}"

  local p ; for p in "${_ceph_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

# vim:set ts=2 sw=2 et:
