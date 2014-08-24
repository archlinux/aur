# Maintainer: James An <james@jamesan.ca>

pkgname='drupal-l10n'
pkgver='7.31'
pkgrel=1
pkgbase='drupal-l10n'
pkgdesc="Drupal core translation files"
arch=('any')
url="https://localize.drupal.org/translate/projects/drupal"
license=('nonfree')
groups=('drupal')
depends=('drupal')
source=('get-locales-names.php')
md5sums=('9849c031dd27ff240e31d8c153e898eb')

# get Drupal's official list of locales keyed by iso code
declare -A _LOCALE_NAMES=$(php -f get-locales-names.php)

# known source files keyed by iso code
declare -A _LOCALE_MD5SUMS=(
    [af]='02eec2352849cd07916e1988bfde7a21'
    [am]='d95c36d409baa2b32340289c28835d2a'
    [ar]='0df0bba2cb70e5a444cb2bc3d2a05475'
    [ast]='1d66cff74035cecc662d3e6e5853682b'
    [az]='56521b7be4166df751c79d9bbffbcbcd'
    [be]='f56428a7e76d9fc9d16c3685261ffba8'
    [bg]='70dac81e067228688806c312a8b4fc2a'
    [bn]='e19d5f9bb28d512efec0cd631e4d0a5e'
    [bo]='f3ac3e028d17911c4819b762d3a73ed0'
    [bs]='5a2f81237ea65f3dce7a1d670b0fd35e'
    [ca]='f6b31f7e2aa333cd7a6aa7648430f950'
    [cs]='4ac5cb091168cde6c510de1098411abc'
    [cy]='12f9cf444f2f6d867bbec355d907df99'
    [da]='fa89e7fcc1c74dd0e0ed00ffebba550c'
    [de]='f701f2cd4dc108083eb418d78a9b9990'
    [dz]='a75f893c4e8c0c595dd634e7d4d52ce1'
    [el]='5de740e5685b4efbff906a248d1b98f6'
    [en-gb]='b26b86e9deead3aa34dee4632c6df329'
    [eo]='3e1441c712d70ff6fe3e8c061a7b4ea1'
    [es]='40d14fd3f592af117ffe02b8b03646e1'
    [et]='f5af845a5b03e8f5642da99cea805b64'
    [eu]='d0d48b3d846c4e2002f8ebe0703b5a87'
    [fa]='0f2c5061d630d3df15d23774108cb9eb'
    [fi]='51a47fa29f547f61f7b0cb947cee1034'
    [fil]='3b543866095e3b617f7fed99681fb2e2'
    [fo]='25f4a8acd1d25302f48bc049dc384b0d'
    [fr]='e1c022c473381d35853ccfcf44e77176'
    [fy]='547d0e0c19c5a45033581bf7ea7b9204'
    [ga]='7986029adddc9d6f031e0bb01aad7fd0'
    [gd]='162d1d7b2ee0015c66b590c32963177e'
    [gl]='1aade7ea1dc75c6da1a025508820c751'
    [gsw-berne]='d8d434709c3e975d02546d5e0b7fcbad'
    [gu]='2b2c2786d58f598263f84cd911e108b9'
    [he]='3741f8bf769e0604098f5a7f25ad356b'
    [hi]='4a436aea737ae34ca904a079b130192c'
    [hr]='f2ef939ab9307911da26d15f09d0b6f8'
    [ht]='c5b83e4d41d3058cb87ca32cac96ac37'
    [hu]='c981a15956dacd42d28239da2fb6490a'
    [hy]='f976222bfbd38e60d6fd95252cc81389'
    [id]='44d2e1f97a5deb5d72b47853403c883a'
    [is]='9092e0b66e2e5356b67e982218dc2242'
    [it]='609dc7ab1676f3b73d71d8c0ac97217a'
    [ja]='2959af846eeb771a9943957a0ea8d915'
    [jv]='77fa2695be69f2d75462df3fddce32a7'
    [ka]='bfe77a54ce99a47452128d6336ea75ca'
    [kk]='da5bb46a55743a2ddddcbbe57e9d8c03'
    [km]='92cf8bd0881ef1188d82e3de15a92685'
    [kn]='a0485cb3ba91d4f66d967713f3a65494'
    [ko]='e74181f4a237a481b8a90aaea4903b6d'
    [ku]='e28bc896f8bfb1d86bb9d83bfc2f84b8'
    [ky]='cd754ac8dc53fcfbb054551391f6d3d4'
    [lo]='6b316df42cb19032a95dfcaebd71cfd9'
    [lt]='c6cf41dee6939612f805d78daaa062de'
    [lv]='d6d96cdf8c6848ae6ac84efcbae49361'
    [mg]='75207b4ef3ce59531db2820130b7f6a4'
    [mk]='8ec5eec57a400baddbb613874cde4c33'
    [ml]='442891f9e367a4b5ce6f57312d22f870'
    [mn]='9da573b109d9e135d6deae9cd8b26af7'
    [mr]='7adb3d9d98e814ec3eb548f38ce560e3'
    [ms]='bde801693883d2b5cdf12d12b243a88b'
    [my]='ae304c83c7a6f96ff20e65e702f181c5'
    [nb]='297e10cb0021e0fa5468aff03f4bc285'
    [ne]='6d60d87c1ee0f3d14e0f33c234056f86'
    [nl]='9c7c95ebb35134bf487e723288f4059c'
    [nn]='16f926a5a15680a4e057d066addedaec'
    [oc]='742d220b34960ba984fb2f5665c3c97b'
    [or]='d59716f294765951239714ce719757b8'
    [pa]='30356469d748765fc0c8b5114f606e15'
    [pl]='c40e87d123dc8740053227af0f19e244'
    [pt-br]='654f60ecbfed1978a29748cfe00ea1d3'
    [pt-pt]='6403b238e5d9d7c06ecb99d97263acd1'
    [rhg]='6c187aebc6c457aeb8a679654f5ac7b2'
    [ro]='d399236a80615a54b123874490e09966'
    [ru]='d93aebdc010740a752d7f119c5915c1c'
    [sco]='be6669d204a887a585c154a3729965a8'
    [se]='20d761ebdc6e5fe25b9e79adc862864c'
    [si]='daf5b6c05bf27dad3b564ff102f3575a'
    [sk]='504fcff04f774b073839a3d03956840f'
    [sl]='201ce013db478673bf19631d80aaa89a'
    [sq]='4f60ef36294f5cf306ae47a83b039c8f'
    [sr]='5b4d1dab4752b2f07716b6309910df23'
    [sv]='d647aa951e08fa4917370c2ea31752dd'
    [sw]='db0904250413b68b730e96c47b479e15'
    [ta]='c35edf8449ccd549b78657c50bcba3fb'
    [ta-lk]='d245c29ecb46168f941d6269cf4591dd'
    [te]='f1cde3e56e730a338489f8c5bbca63aa'
    [test]='76504f9bf6bc07b2fc745b33451869f7'
    [th]='84a206df280e4b430a2d385f75f2b603'
    [tr]='be366184a1e0bffd2c40a819bcb2912f'
    [tyv]='15123c16fc244f351a1cfb94653c9a4f'
    [ug]='098a23d0db1886d4dea14b6eaf59342b'
    [uk]='5f9178a915f0e5679693542b14e45683'
    [ur]='d4a66f4148cdb26032a176fbed7f2da5'
    [vi]='8e45ca693afbc254afd0bf947eaacbe9'
    [xx-lolspeak]='aca2dd419801029f5f8423723255dc4d'
    [zh-hans]='e2835643af92238b564ff60e3a3517b4'
    [zh-hant]='87ecece3f52ad1c0c356ef92b645352a'
)

# get latest list of locales available to build, otherwise default to pre-fetched list
declare -a _locales=($(curl https://localize.drupal.org/translate/downloads | grep -oh "${pkgver}\.[a-z\-]*\.po" | cut -f3 -d. | sort))
if [ ${#_locales[@]} -eq 0 ]; then
    _locales=(af am ar ast az be bg bn bo bs ca cs cy da de dz el en-gb eo es et eu fa fi fil fo fr fy ga gd gl gsw-berne gu he hi hr ht hu hy id is it ja jv ka kk km kn ko ku ky lo lt lv mg mk ml mn mr ms my nb ne nl nn oc or pa pl pt-br pt-pt ro ru sco se si sk sl sq sr sv sw ta te th tr ug uk ur vi xx-lolspeak zh-hans zh-hant)
fi

declare -r _url_source="http://ftp.drupal.org/files/translations/7.x/drupal"
declare -r _url_locale="https://localize.drupal.org/translate/languages"
for _locale in ${_locales[@]}; do
    # skip locale if it's not present in Drupal's official list of locales
    [ ! -v _LOCALE_NAMES[$_locale] \
     -a -v _LOCALE_MD5SUMS[$_locale] ] && continue;

    _filename="drupal-${pkgver}.${_locale}.po"
    _localename="${_LOCALE_NAMES[${_locale}]}"
    source[${#source[@]}]="${_url_source}/${_filename}"
    md5sums[${#md5sums[@]}]="${_LOCALE_MD5SUMS[${_locale}]}"
    pkgname[${#pkgname[@]}]="${pkgname[0]}-${_locale}"

    # instantiate locale-specific packaging function using parameters: iso code, locale name, and Drupal version
    eval "package_drupal-l10n-${_locale}() {
        pkgdesc=\"Drupal core translation: ${_localename}\"
        url=\"${_url_locale}/${_locale}\"
        install -Dm644 \"\${srcdir}/${_filename}\" \"\${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/${_filename}\"
    }"
done

# meta package depends on all other packages created here
package_drupal-l10n() {
    pkgdesc="Drupal core translation: meta package"
    depends=("${pkgname[@]}")
    unset depends[0] # remove self-dependency
}
